# Randome Knowledge - October 2018

## Git
- In Git, since we can add any repository copy as a remote, it' so easy to collaborate. Linus certainly did help open source a great deal with this. And then there is Linux. Linus did some great job for open source.
- In `git branch` and `git checkout -b` you can also specify the starting point: `git checkout -b newBranch develop`

## JavaScript
- Look at this:
```javascript
function example() {
    try {
        return true;
    }
    catch {
        return false;
    }
    finally {
        return true;
    }
}
```

The above code will always return true because of finally. Read the discussion [here][1].

- Good to read: [Promises Finally...][2]
- A [good article][3] on testing react components with Enzyme and jest.
- ### How tools calculate coverage?
By parsing the code and inserting increment statements in between. For example, this code:

```javascript
function foo (a) {
    if (a) {
        // do something with 'a'.
    } else {
        // do something else.
    }
}
```
Gets transformed to:
```javascript
function foo(a) {
    cov_2mofekog2n.f[0]++;
    cov_2mofekog2n.s[0]++;
    if (a) {
        // do something with 'a'.
        cov_2mofekog2n.b[0][0]++;
    } else {
        // do something else.
        cov_2mofekog2n.b[0][1]++;
    }
}
```
where, `cov_2mofekog2n.f[0]++` indicates that the function foo was executed, `cov_2mofekog2n.s[0]++` indicates that a statement within this function was called, and `cov_2mofekog2n.b[0][0]++` and `cov_2mofekog2n.b[0][1]++` indicate that branches were executed. Based on these counts, reports can be generated. But this is slow and can cause bugs. [This guy tried][4] using V8 to generate coverage reports instead.
-  ### Actor Model
  A nice article on [Actor Model by DasSurma][6]. He tries to justify how the web along with WebWorkers implements an Actor Model. Actor model has actors. Actors are single threaded. But many actors can run at same time. Actor model allows running complex highly parallel apps. Actors can create actors (main thread which manages DOM creates another Actor - the Web Worker). 
  
  In Actor Model, any shared resource is owned by another Actor called managing Actor and everyone else calls this Actor if it wants to do anything to shared resource. Since the managing actor is single threaded, no need for semaphores, etc. Main thread is the managing actor for DOM on the web.

- [Transcrypt][7] is a project that allows you to transpile a subset of python code to js and run on the browser.
- Brython and Skulpt are implementations of Python (compiler) in JS, so you can ship JS code and use them to compile and run Python code on the browser.
- [Pyodide][8] CPython - Python interepreter written in C compiled to WASM.
- A very good [article][9] on Coroutines in JavaScript.
- Immer - a library that allows writing reducers just like you would modify an object but the original state is never modified, so you don't have to create all that spread mess to take care of immutability. It follows a copy on write strategy. Take a look [here][10].

## Code Quality
- VSCode has ctrl+shift+r that suggests some refatoring for the selected code snippet.
- Select a variable and press F2 to rename that symbol and VSCode will automatically rename it across the file.
- A good article on [software architecture principles][12].

## Server Side stuff
- Microservices architecture, instead of a monolith service, deploy several small service independently, for example auth service, cab booking service, route determination service, etc, i.e. instead of a single code acontaining /auth, /rides, /routes, etc endpoints, different deployments handle each of these separately, in fact each may choose different technology stack, based on what fits best for that service.
- Serverless computing/architecture is basically - you don't have to manage servers manually by yourself, third party vendor like AWS will take care of it. You just provide it a function (a package with code to be run on some event) and it will automatically allocate resource for you to run that code and process the content. An example offering is AWS Lambdas. Read more here about [serverless computing][11].
- A good beginner's [intro to graphql][5].

## Misc
- Base58 encoding is used to represent Wallet Addresses for Bitcoin. It removes O and 0, I and l which can look like the same character in most fonts. So, the resulting alphabet is: ***123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz***



[1]: https://stackoverflow.com/a/3838130/2407962
[2]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally
[3]: https://blog.bitsrc.io/how-to-test-react-components-using-jest-and-enzyme-fab851a43875
[4]: https://blog.npmjs.org/post/178487845610/rethinking-javascript-test-coverage
[5]: https://medium.freecodecamp.org/a-beginners-guide-to-graphql-60e43b0a41f5
[6]: https://dassur.ma/things/actormodel/
[7]: https://www.transcrypt.org/docs/html/what_why.html
[8]: https://github.com/iodide-project/pyodide
[9]: https://x.st/javascript-coroutines/
[10]: https://github.com/mweststrate/immer
[11]: https://serverless-stack.com/chapters/what-is-serverless.html
[12]: https://hackernoon.com/first-do-no-harm-30-principles-that-helped-me-avoid-fly-by-architecture-reviews-e8952ac632a

