# Finding Stuff in Git

## View History of changes to a file

`git log <path/to/file>`

To view the above logs in a detailed way, i.e. along with the changes that were made in each commit:

`git log --path <path/to/file>`

Or, see who last changed this file (line by line changes):

`git blame <path/to/file>`

Or, see changes made to a file in a given time frame, say 3 weeks:

`git log --since=three.weeks.ago --reverse -- <path/to/file>`

Or, all commits in a time range

`git log --after=”April 1, 2016" --before=”April 30, 2016" `

## Find when a given string was introduced in code

`git log -S"Bad line of code as a string"`

## View commits by author
`git log --author=tapan`

## When you know a good commit and a bad commit

When you need to find a commit that caused the bug and you know the commit where the bug is present and another commit where the bug is not present, you can use git bisect to narrow down to the first bad commit using Binary Search as follows:

```
git bisect start
git bisect bad HEAD
git bisect good <commit where it worked>
```

The above checks you out on a commit in between, test the code and if:
1. The bug is still there: `git bisect bad`
2. The bug is not there: `git bisect good`

Repeat until you find the culprit commit. And then do `git bisect reset`.

If you have a script that builds and tests your code, you can automate the above process using:
`git bisect start HEAD <commit where it worked> run ./buildAndTest.sh`

## Checkout or see changes in a file from another branch
`git checkout otherBranch <path/to/file>`

`git show otherBranch:<path/to/file>`

## View number of commits per author
`git shortlog -s`

Sort descending by commit count:
`git shortlog -s -n`

## See if a file exists in the current repo
`git ls-files **/filename.js`

## Grep inside files
`git grep “some string or pattern”`


