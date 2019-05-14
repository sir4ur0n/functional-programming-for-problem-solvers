// src/CodeHighlighter.js
"use strict";

require("./someJavascript.js")

// Unbabelified version because I can't figure out how to integrate Babel with Pulp build workflow :(
var _prismCore = _interopRequireDefault(require("prismjs/components/prism-core"));

require("prismjs/components/prism-clike");

require("prismjs/components/prism-javascript");

require("prismjs/components/prism-css");

require("prismjs/components/prism-markup");

require("prismjs/components/prism-haskell");

require("prismjs/components/prism-java");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

// Given an HTML reference, some code and a language, return the same code enhanced with Prismjs elements for colored display
exports.highlight = function (htmlElement) {
    return function (language) {
        return function (code) {
            return function () {
                const languagePair = pickLanguage(language);
                htmlElement.innerHTML = _prismCore["default"].highlight(code, languagePair.grammar, languagePair.name);
            };
        };
    }
};

function pickLanguage(language) {
    var result;
    switch (language) {
        case "haskell":
            result = {
                grammar: _prismCore["default"].languages.haskell,
                name: 'haskell'
            };
            break;
        case "java":
            result = {
                grammar: _prismCore["default"].languages.java,
                name: 'java'
            };
            break;
    }
    return result;
}