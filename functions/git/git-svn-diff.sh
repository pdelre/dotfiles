#!/bin/sh

HASHES="$@"
FIRST_HASH=`echo ${HASHES} | cut -d' ' -f 1`
REV=`git svn find-rev ${FIRST_HASH}`

INDEX_SEPARATOR="==================================================================="

# Note: removed the $* to support passing a hash as the first argument
git diff --no-prefix ${HASHES} |
sed "
# New files have /dev/null as their original path
/^--- \/dev\/null/{
# Read a line into the pattern space
	N
# Do a multiline substitution
		s/^--- \/dev\/null\n+++ \(.*\)$/--- \1\t(revision 0)\n+++ \1\t(working copy)/
# Jump to the end of the script. This skips the next two substitutions
		b end
}
/^diff --git /{
# Read a line into the pattern space
	N
# In case there is no 'new file mode' line
		/^diff --git \(.*\) .*\nindex .*$/{
			s/^diff --git \(.*\) .*\nindex .*$/Index: \1\n${INDEX_SEPARATOR}/
			b end
		}
# There is a 'new file mode' line
# Read a third line
	N
# In case there is a 'new file mode' line
		/^diff --git \(.*\) .*\nnew file mode .*\nindex .*$/{
# Do a multiline substitution
			s/^diff --git \(.*\) .*\nnew file mode .*\nindex .*$/Index: \1\n${INDEX_SEPARATOR}/
			b end
		}
# In case there is a 'deleted file mode' line
	/^diff --git \(.*\) .*\ndeleted file mode .*\nindex .*$/{
# Do a multiline substitution
		s/^diff --git \(.*\) .*\ndeleted file mode .*\nindex .*$/Index: \1\n${INDEX_SEPARATOR}/
		b end
	}
# There is an 'old mode' line
# Read a forth line
	N
# Do a multiline substitution
		s/^diff --git \(.*\) .*\nold mode .*\nnew mode .*\nindex .*$/Index: \1\n${INDEX_SEPARATOR}/
	b end

}
/^--- \(.*\)/{
# Read a line into the pattern space
	N
# Do a multiline substitution
		s/^--- \(.*\)\n+++ .*$/--- \1\t(revision ${REV})\n+++ \1\t(working copy)/
# Jump to the end of the script. This skips the next two substitutions
		b end
}
: end
"
