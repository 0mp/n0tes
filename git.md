Basic gitology
--------------

Expand all paths with `git status`

    git status -u

Publish your commits

    git push origin master

Pull and append local commits

    git pull --rebase origin master

If that fails then edit the conflicted files and

    git add <some-file>
    git rebase --continue

Or if everything goes wrong then

    git rebase --abort

Branches
--------

Request a new branch

    git checkout -b awesome-branch master

Push feature branch to the central repository

    git push -u origin awesome-branch

Later on to push the latest commits to the central repository

    git push

Merge the feature into master

    git checkout master
    git pull
    git pull origin awesome-branch
    git push

### Clean up

Delete stale remote-tracking branches

    git remote prune <remote>

Sync the server list of branches with the local list.

    git push --mirror <origin>
