const mysql = require('mysql');
const shared = require('./shared');
const database = require('./databse');

[1].forEach(exNum => {
    const userQueries = shared.normalizeUserSqlFile(exNum);
    const solutionQueries = shared.normalizeSolutionsSqlFile(exNum);
    Object.entries(userQueries).forEach(kv => {
        if (!kv[1].sql) return;
        test(`Exercise ${exNum.toString().padStart(2, '0')} - ${kv[1].desc || kv[0]}`, async () => {
            const data = await database.runQuery(kv[1].sql.toLowerCase());
            const results = await database.runQuery(solutionQueries[kv[0]].sql.toLowerCase());

            expect(data).toEqual(results);
        });
    });
})
