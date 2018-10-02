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

## Server Side stuff
- Microservices architecture, instead of a monolith service, deploy several small service independently, for example auth service, cab booking service, route determination service, etc, i.e. instead of a single code acontaining /auth, /rides, /routes, etc endpoints, different deployments handle each of these separately, in fact each may choose different technology stack, based on what fits best for that service.
- A good beginner's [intro to graphql][5].
- A nice article on [Actor Model by DasSurma][6]. He tries to justify how the web along with WebWorkers implements an Actor Model. Actor model has actors. Actors are single threaded. But many actors can run at same time. Actors can create actors (main thread which manages DOM creates another Actor - the Web Worker). In Actor Model, any shared resource is owned by another Actor called managing Actor and everyone else calls this Actor if it wants to do anything to shared resource. Since the managing actor is single threaded, no need for semaphores, etc. Main thread is the managing actor for DOM on the web.



[1]: https://stackoverflow.com/a/3838130/2407962
[2]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally
[3]: https://blog.bitsrc.io/how-to-test-react-components-using-jest-and-enzyme-fab851a43875
[4]: https://blog.npmjs.org/post/178487845610/rethinking-javascript-test-coverage
[5]: https://medium.freecodecamp.org/a-beginners-guide-to-graphql-60e43b0a41f5
[6]: https://dassur.ma/things/actormodel/

