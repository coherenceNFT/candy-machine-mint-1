/* 
Install dotenv module
# with npm
npm install dotenv

# or with Yarn
yarn add dotenv
*/

// Module to read .env files
require('dotenv').config();

// exec() for Node to run commands
const { exec } = require("child_process");

// Test string to run command
test1 = "metaplex " + process.env.HELP;

exec(test1, (err, stdout) => {
    if (err) {
      // node couldn't execute the command
      console.log("ERROR!");
      return;
    }
  
    // the *entire* stdout (buffered)
    console.log(`stdout: ${stdout}`);
  });
