#!/usr/bin/env bash

# <xbar.title>AWS Login Monitor</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Paul DelRe</xbar.author>
# <xbar.desc>AWS Login Status</xbar.desc>
# <xbar.image></xbar.image>
# <xbar.dependencies>bash,glab,jq</xbar.dependencies>
# <xbar.abouturl></xbar.abouturl>

export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_SESSION_TTL=12h
export AWS_DEFAULT_PROFILE=dev

signedIn=$(echo "| sfImage=person.icloud sfconfig=$(echo -n '{"renderingMode":"Palette", "colors": ["white"], "scale": "large"}' | base64)")
signedOut=$(echo "| sfImage=xmark.icloud sfconfig=$(echo -n '{"renderingMode":"Palette", "colors": ["red"], "scale": "large"}' | base64)")

# Function to check AWS login status
check_aws_login() {
    if aws sts get-caller-identity &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Main function
main() {
    if ! check_aws_login; then
        aws sso login &> /dev/null
    fi

    if check_aws_login; then
        echo "$signedIn"
        echo "---"
        echo "Signed In"
    else
        echo "$signedOut"
        echo "---"
        echo "Cannot sign in"
    fi

    echo "---"
    echo $SHELL
    env | grep ^AWS_ | sort
    echo "---"
    aws sts get-caller-identity --output yaml 2>&1
    echo "---"
    echo "Last checked: $(date '+%Y-%m-%d %H:%M:%S') | refresh=true shortcut=CMD+SHIFT+R"
}

main
