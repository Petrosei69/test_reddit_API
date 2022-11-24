*** Variables ***

#Auth data
${client_id}=          ###
${secret_key}=         ###
${username}=           ###
${password}=           ###

#Post data
${post_id}=            ###
${comment}=            ###

#Token data
${token_url}=          https://ssl.reddit.com/
${base_url}=           https://oauth.reddit.com/

#Api data
${headers}=            MyAPI/0.0.1
${url_search}=         search/?q=
${url_send_post}=      api/comment
${url_del_comment}=    api/del
${auth_url}=           api/v1/access_token
${check_auth_url}=     api/v1/me