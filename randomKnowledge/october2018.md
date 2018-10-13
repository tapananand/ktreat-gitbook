# Randome Knowledge - October 2018

## Git
- In Git, since we can add any repository copy as a remote, it' so easy to collaborate. Linus certainly did help open source a great deal with this. And then there is Linux. Linus did some great job for open source.
- In `git branch` and `git checkout -b` you can also specify the starting point: `git checkout -b newBranch develop`

## Web
- The Render Tree is formed by combining the DOM and the CSSOM. The render tree only contains visible nodes and is used to compute the layout of these visible nodes.  
- JS parsing may have to wait for all CSS to be downloaded, since JS code may query/modify the CSSOM. So always have css on top of page => link tags inside head.
- There is a source map spec at: https://sourcemaps.info/spec.html, a nice [article][16] that summarizes it.
- We can send an HTTP header called `SourceMap: <url>` with each file to specify the sourcemap location instead of annotating it as a comment in the file. You can even host the sourcemap on a private location or even localhodst so that nobody else can access it but you can debug it when you run the code.
- Ideally, Chrome tries to run every tab in a separate process, including cross origin iframes, but when less memory available or too many tabs it tries to group same origin tabs into same process. Creating different has the memory limitation that common stuff like the V8 engine have to be present as a copy in each process, hence the above optimization is required.
- [WorkerDOM][17] making DOM APIs available in web worker.

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
- A nice approach to improving install times in Yarn without node_modules - [Yarn PlugNPlay][13].
- async/await is just syntactic sugar over promises and generators, translate `await` to `yield` and imagine async function being transalted to a generator function. Now, all it has to do is, do a `.then` on the promise given to `await` and inside then, it will just do `it.next(valueWithWhichThePromiseResolved)` and voila your `await` expression can be assigned to a variable.
- In JS engines some part of the engine is self-hosted, i.e. written in the same language itself, i.e. written in JS itself. Why? Because, say for functions that take JS callbacks, like forEach, sort, etc, if it was implemented in C++, then there would be context switches between the C++ world and the interpreted JS world to call the callback. These context switches are slow, hence self-hosted instead.

## Security
- [A nice read][15] on how Alexa and other Speech recognition systems can be made to listen something from a audio clip which us humans won't be able to listen, thus allowing an attack via say a TV commercial. For example, you can make Alexa hear turn off security camera while you are luistening to some news and you won't even get to know that that command was uttered to Alexa.

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
- Amazon Echo and Google Home use [Kaldi][14] - an open source speech recognition Toolkit.



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
[13]: https://github.com/yarnpkg/rfcs/files/2378943/Plugnplay.pdf
[14]: http://kaldi-asr.org/
[15]: https://adversarial-attacks.net/
[16]: https://medium.com/@trungutt/yet-another-explanation-on-sourcemap-669797e418ce
[17]: https://amphtml.wordpress.com/2018/08/21/workerdom/

