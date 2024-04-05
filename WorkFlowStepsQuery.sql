SELECT 
        dbua.GroupMemberLastName
      , dbua.GroupMemberFirstName
      , ws.WorkFlowStepKey
      , ws.WorkFlowStepDescription
      , ws.WorkFlowStepTableRowCount
      , CAST(DATEDIFF(ms, MIN(ws.StartingDateTime), MAX(ws.EndingDateTime)) as varchar(100)) + ' ' + 'ms' AS ExecutionTime
FROM Process.WorkflowSteps AS ws
FULL OUTER JOIN DbSecurity.UserAuthorization AS dbua
ON ws.UserAuthorizationKey = dbua.UserAuthorizationKey
WHERE ws.UserAuthorizationKey = 1
GROUP BY ws.WorkFlowStepKey, ws.WorkFlowStepDescription, ws.WorkFlowStepTableRowCount, dbua.GroupMemberFirstName, dbua.GroupMemberLastName;