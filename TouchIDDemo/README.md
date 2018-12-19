# Simple Touch ID Demo 
- Used **LocalAuthentication** to work with Touch ID 

## Steps 
Getting Started 
1. Add **LocalAuthentication.framework** on Project Settings
<img src="https://github.com/jeminson/BASIC/blob/master/TouchIDDemo/Images/addLocalAuthentication.png" />

Work on View Controller 
1. import **LocalAuthentication**
2. Add **buttons** on storyboard && **IBAction** for that button action 
3. Create authentication context -> **LAContext class**

      ```let authenticationContext = LAContext()```

4. Check for Touch ID availibility by calling the method **canEvaluatePolicy**

      ```authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)```

5. Check the fingerprint by calling the method **evaluatePolicy**

      ```authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Only for authentication users")```


## Details 
* What does **LAContext()** do, and why do we need it?
    + It creates and configures the context so that it can carray out the authentication 
* Why do we need **canEvaluatePolicy()**? 
    + Because not every decive have TouchID sensor, so we need to check if it has fingerprint sensor 
* Why do we need **evalutePolicy()**?
    + We need to check and evaluate that if we can use the fingerprint sensor 

    

