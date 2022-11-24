*** Settings ***
Library      RequestsLibrary
Resource     authorization.robot
Resource     variables.robot

*** Test Cases ***
Reddit API test
    ${headers}=       Authorization
    Create Session    auth    url=${base_url}    verify=true
    ${response}=      GET On Session    auth    ${check_auth_url}    headers=${headers}
    Status Should Be  200    ${response}

    ${fullname_post}=       Find Post    ${headers}
    ${fullname_comment}=    Send Comment    ${headers}    ${fullname_post}
    Del Comment          ${headers}    ${fullname_comment}


*** Keywords ***
Find Post
    [Arguments]    ${headers}
    ${post_url}    Catenate    SEPARATOR=    ${url_search}    ${post_id}

    LOG    ${post_url}

    Create Session    alias=work_post    url=${base_url}    verify=true
    ${response}=    GET On Session    work_post    ${post_url}    headers=${headers}
    Status Should Be    200     ${response}
    ${fullname}=    Catenate    ${response.json()['data']['children'][0]['data']['name']}

    LOG    ${fullname}
    [Return]    ${fullname}

Send Comment
    [Arguments]    ${headers}    ${fullname}

    ${body}=    Create Dictionary    parent=${fullname}    text=${comment}
    ${response}=    POST On Session    work_post    ${url_send_post}    data=${body}    headers=${headers}
    Status Should Be    200    ${response}

    LOG    ${response.json()['jquery'][-4][3][0][0]['data']['name']}

    [Return]    ${response.json()['jquery'][-4][3][0][0]['data']['name']}


Del Comment
    [Arguments]    ${headers}    ${fullname}
    ${body}=    Create Dictionary    id=${fullname}
    ${response}=    POST On Session    work_post    ${url_del_comment}    data=${body}    headers=${headers}

    Status Should Be    200    ${response}