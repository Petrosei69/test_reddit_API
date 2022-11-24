## Test task Robot Framework Reddit API

This program tests reddit API to create token and authorization, send and delete comment.
## Requirements
This commands you'll need to install before run the program.




```shell
pip install robotframework
pip install requests 
pip install robotframework-requsts
pip install robotframework-jsonlibrary
```

You must enter your own data in variables.robot

```shell

#Auth data
${client_id}=          #enter your data
${secret_key}=         #enter your data
${username}=           #enter your data
${password}=           #enter your data

#Post data
${post_id}=            #enter your data
${comment}=            #enter your data
```