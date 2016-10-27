#!/bin/bash

(
#                       echo "Script name: $0"
                echo "Positional arguments: ${@}"
                echo "STASH_USER_NAME: $STASH_USER_NAME"
                echo "STASH_USER_EMAIL: $STASH_USER_EMAIL"
                echo "STASH_REPO_NAME: $STASH_REPO_NAME"
                echo "STASH_IS_ADMIN: $STASH_IS_ADMIN"
                while read from_ref to_ref ref_name; do
                        date
                        echo "Ref update:"
                        echo " Old value: $from_ref"
                        echo " New value: $to_ref"
                        echo " Ref name:  $ref_name"
#                git show $from_ref..$to_ref | sed 's/^/  /'
                if [ $ref_name == "refs/heads/master" ]; then
                echo -e "-Pushing to branch_name-"
                cd /var/atlassian/application-data/bitbucket/shared/data/repositories/1
                git push --force original master:hotfix >> /tmp/external-hooks-test.log 2>&1
                echo -e "-Finished pushing-"
                fi
        done
) | tee -a /tmp/external-hooks-test.log
