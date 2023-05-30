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

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

admin.initializeApp();

// Listens for any document created in the users collection
exports.translateText = functions.firestore
  .document("todos/{id}")
  .onCreate(async (snap, context) => {
    const todoObject = snap.data();
    const itemDocRef = admin.firestore().collection("todos").doc(todoObject.id);

    //APIKEY AIzaSyDSN7XsECK7t5Trd-z2CO_1iI5kpMvhbNQ
    await axios
      .get("https://translation.googleapis.com/language/translate/v2", {
        params: {
          key: "AIzaSyDSN7XsECK7t5Trd-z2CO_1iI5kpMvhbNQ",
          target: "en",
          q: todoObject.title,
        },
      })
      .then((response) => {
        itemDocRef.update({
          "translated_title": response.data.data.translations[0].translatedText.toString(),
        });
      });

    return await axios
      .get("https://translation.googleapis.com/language/translate/v2", {
        params: {
          key: "AIzaSyDSN7XsECK7t5Trd-z2CO_1iI5kpMvhbNQ",
          target: "en",
          q: todoObject.description,
        },
      })
      .then((response) => {
        itemDocRef.update({
          "translated_description": response.data.data.translations[0].translatedText.toString(),
        });
      });
  });
