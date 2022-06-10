const os = require('os');
const fs = require('fs');

const questionRegex = /(\d{1,2}\.\d{1,2}) /g;

/**
 * 
 * @param {string} fileContent 
 * @returns {Object} normalized object
 */
function normalizeData(fileContent) {
    const splitted = fileContent.split(os.EOL).map(l => l.trim()).filter(l => !!l);

    let currentKey;
    return splitted.reduce((prev, curr) => {
        if (curr.indexOf('-- LINK') > -1) return prev;

        const match = curr.match(questionRegex);
        if (match) {
            currentKey = match[0].trim();
            prev[currentKey] = {};
        } else {
            const subKey = curr.trim().indexOf('--') === 0 ? 'desc' : 'sql'
            if (!prev[currentKey][subKey]) prev[currentKey][subKey] = '';

            prev[currentKey][subKey] += ' ' + curr;
        }

        return prev;
    }, {});
}

/**
 * 
 * @param {number} exerciseNumber 
 */
function normalizeUserSqlFile(exerciseNumber) {
    const fileName = `./SQL_exercise_${exerciseNumber.toString().padStart(2, '0')}/${exerciseNumber}_questions.sql`;
    const sqlFile = fs.readFileSync(fileName, 'utf8');

    return normalizeData(sqlFile);
}

/**
 * 
 * @param {number} exerciseNumber 
 */
function normalizeSolutionsSqlFile(exerciseNumber) {
    const fileName = `./SQL_exercise_${exerciseNumber.toString().padStart(2, '0')}/${exerciseNumber}_questions_and_solutions.sql`;
    const sqlFile = fs.readFileSync(fileName, 'utf8');
    return normalizeData(sqlFile);
}

module.exports = {
    normalizeUserSqlFile,
    normalizeSolutionsSqlFile
}