/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

//exports.helloWorld = onRequest((request, response) => {
//  logger.info("Hello logs!", { structuredData: true });
//  response.send("Hello from Firebase!");
//});

// Listens for any document created in the users collection
exports.createUser = functions.firestore.document('users/{userId}')
  .onCreate((snap, context) => {
    // Get an object representing the document
    const newValue = snap.data();
    const name = newValue.name;
    // perform desired operations ...

  });