# Functional programming for problem solvers
An attempt at showcasing how Problem Solvers can use Functional Programming to solve real world problems.

## Audience
You are likely to find this interesting if any of these apply to you:

* You are interested in Functional programming but you don't want to dive into maths and Category Theory.
  * No worries! Pick the "Just code" or "Code and explanations" mode and you're good to go. No Category theory, no Endofunctor or Monad lingo. You want to solve real world problems. FP is ideal for that!
* You are interested in Functional programming but you don't want to learn Haskell.
  *  No worries, code examples are provided in many languages! And if you don't find your language, open an issue so that somebody adds it.
* You are interested in Functional programming and you love all the theory behind too.
  * We also got your back! Just switch to "Full ham" and we'll help you grasp the concepts as well as the theory behind.
* You already know Functional programming in language X but you want to learn language Y.
  * Be our guest! Go back and forth between languages X and Y to compare code. For sure this will give you a good start in learning Y.

## But why?
I have come across many developers who are interested in/curious about FP but never dare go further because of common beliefs:
* "Functional programming is maths, and I hate maths"
* "Functional programming is for academics"
* "Functional programming is much more complex than OOP"

All of these are false. This project is attempting to address these beliefs through pragmatic, real world problems being solved by FP.

* Unlike OOP, FP is backed by maths (many FP concepts originated in maths), however you don't need maths to understand and use FP.
* FP is used in many companies, and OOP languages are shifting towards FP (e.g. Java, C++) *because* of industry traction, not to make academics happy.
* FP is no more complex than OOP. However OOP and FP have different approaches to problems, so learning FP when you are used to OOP means *accepting to re-learn*. This can be perceived as "more complex" by experienced OOP developers because they need to get back to a "learn to code" mindset. A nice example is people who learn to code for the very first time in FP get up to speed as quickly as those who learn OOP.

## Getting started
```
npm install
```

## Building
```
npm run build-production
```
Then open `./dist/index.html` in your favorite browser.

## Watch
I am a noob with front bundlers etc., the best workflow I got so far is to open 2 watchers in parallel terminals to resp. watch PureScript and JavaScript files:
```
npm run watch-ps
```
and
```
npm run watch-js
```
Then open `./dist/index.html` in your favorite browser.