 # archive git branch using tags
 ```sh
 # tag branch
 git tag archive/<branchname> <branchname>
 # delete the branch from local
 git branch -D <branchname>
 # not sure: may be delete remote branch
 git branch -d -r origin/<branchname>
 # push tags
 git push --tags
 # not sure: may be delete remote branch
 git push origin :<branchname>
 ```
