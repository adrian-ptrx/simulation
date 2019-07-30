PS C:\adrian_ptrx\simulation> .\bin\run_simulation_driver.ps1 -use_case "T1110_vertical_brute_force" -collect_logs:$true
Launching log collector with config: T1110_vertical_brute_force/winlogbeat.yml
Sleeping for 5 seconds
Collecting logs ...
Launching attack simulation: T1110_vertical_brute_force
Simulating attack ...
Stopping log collector process: winlogbeat
Sleeping for 5 seconds
Kill successful.
Done.



SCHEMA
======
{
    "@timestamp":"2019-07-30T23:41:21.052Z",
    "@metadata":{
        "beat":"winlogbeat",
        "type":"_doc",
        "version":"7.2.0"
    },
    "winlog":{
        "process":{
            "pid":4,
            "thread":{
                "id":8668
            }
        },
        "record_id":2030823,
        "task":"Filtering Platform Connection",
        "keywords":[
            "Audit Success"
        ],
        "provider_guid":"{54849625-5478-4994-A5BA-3E3B0328C30D}",
        "event_data":{
            "Application":"\\device\\harddiskvolume2\\windows\\systemapps\\microsoft.microsoftedge_8wekyb3d8bbwe\\microsoftedgecp.exe",
            "RemoteUserID":"S-1-0-0",
            "SourceAddress":"10.10.30.26",
            "SourcePort":"64355",
            "LayerName":"%%14611",
            "Protocol":"6",
            "FilterRTID":"68919",
            "LayerRTID":"48",
            "ProcessID":"15732",
            "RemoteMachineID":"S-1-0-0",
            "Direction":"%%14593",
            "DestAddress":"184.27.37.69",
            "DestPort":"443"
        },
        "channel":"Security",
        "version":1,
        "provider_name":"Microsoft-Windows-Security-Auditing",
        "api":"wineventlog",
        "computer_name":"internal-win10.patternex.lab",
        "opcode":"Info",
        "event_id":5156
    },
    "event":{
        "code":5156,
        "action":"Filtering Platform Connection",
        "created":"2019-07-30T23:43:07.484Z",
        "original":"<Event xmlns='http://schemas.microsoft.com/win/2004/08/events/event'><System><Provider Name='Microsoft-Windows-Security-Auditing' Guid='{54849625-5478-4994-A5BA-3E3B0328C30D}'/><EventID>5156</EventID><Version>1</Version><Level>0</Level><Task>12810</Task><Opcode>0</Opcode><Keywords>0x8020000000000000</Keywords><TimeCreated SystemTime='2019-07-30T23:41:21.052436100Z'/><EventRecordID>2030823</EventRecordID><Correlation/><Execution ProcessID='4' ThreadID='8668'/><Channel>Security</Channel><Computer>internal-win10.patternex.lab</Computer><Security/></System><EventData><Data Name='ProcessID'>15732</Data><Data Name='Application'>\\device\\harddiskvolume2\\windows\\systemapps\\microsoft.microsoftedge_8wekyb3d8bbwe\\microsoftedgecp.exe</Data><Data Name='Direction'>%%14593</Data><Data Name='SourceAddress'>10.10.30.26</Data><Data Name='SourcePort'>64355</Data><Data Name='DestAddress'>184.27.37.69</Data><Data Name='DestPort'>443</Data><Data Name='Protocol'>6</Data><Data Name='FilterRTID'>68919</Data><Data Name='LayerName'>%%14611</Data><Data Name='LayerRTID'>48</Data><Data Name='RemoteUserID'>S-1-0-0</Data><Data Name='RemoteMachineID'>S-1-0-0</Data></EventData><RenderingInfo Culture='en-US'><Message>The Windows Filtering Platform has permitted a connection.\r\n\r\nApplication Information:\r\n\tProcess ID:\t\t15732\r\n\tApplication Name:\t\\device\\harddiskvolume2\\windows\\systemapps\\microsoft.microsoftedge_8wekyb3d8bbwe\\microsoftedgecp.exe\r\n\r\nNetwork Information:\r\n\tDirection:\t\tOutbound\r\n\tSource Address:\t\t10.10.30.26\r\n\tSource Port:\t\t64355\r\n\tDestination Address:\t184.27.37.69\r\n\tDestination Port:\t\t443\r\n\tProtocol:\t\t6\r\n\r\nFilter Information:\r\n\tFilter Run-Time ID:\t68919\r\n\tLayer Name:\t\tConnect\r\n\tLayer Run-Time ID:\t48</Message><Level>Information</Level><Task>Filtering Platform Connection</Task><Opcode>Info</Opcode><Channel>Security</Channel><Provider>Microsoft Windows security auditing.</Provider><Keywords><Keyword>Audit Success</Keyword></Keywords></RenderingInfo></Event>",
        "kind":"event"
    },
    "log":{
        "level":"information"
    },
    "tags":[
        "SJ-Lab",
        "AD",
        "T1110_vertical_brute_force"
    ],
    "agent":{
        "ephemeral_id":"d75498f5-eee7-4374-a449-4b15e0a248e3",
        "hostname":"internal-win10",
        "id":"4d4dac00-b1da-43aa-8e1b-e2ab90df3d36",
        "version":"7.2.0",
        "type":"winlogbeat"
    },
    "ecs":{
        "version":"1.0.0"
    },
    "host":{
        "name":"internal-win10"
    },
    "message":"The Windows Filtering Platform has permitted a connection.\n\nApplication Information:\n\tProcess ID:\t\t15732\n\tApplication Name:\t\\device\\harddiskvolume2\\windows\\systemapps\\microsoft.microsoftedge_8wekyb3d8bbwe\\microsoftedgecp.exe\n\nNetwork Information:\n\tDirection:\t\tOutbound\n\tSource Address:\t\t10.10.30.26\n\tSource Port:\t\t64355\n\tDestination Address:\t184.27.37.69\n\tDestination Port:\t\t443\n\tProtocol:\t\t6\n\nFilter Information:\n\tFilter Run-Time ID:\t68919\n\tLayer Name:\t\tConnect\n\tLayer Run-Time ID:\t48"
}