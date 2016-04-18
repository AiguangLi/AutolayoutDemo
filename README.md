# AutoLayoutDemo
An auto-layout demo for iOS using Visual Format Language

Visual Format Language (VFL) is very useful for iOS developers who like writing iPhone/iPad UI codes without XIB or Storyboard.

Though Apple Inc recommeds to use storyboard to construct UI, I don't like it. Reason as below:
1. Time to load storyboard file is long, especially when UI is complex.
2. Reusability is not good.

Using VFL is excellent for me, such as:
1. UI constraints parameters can be easily modified
2. Good reusability

#How to use
1. Construct your UI components using codes only (XIB also supported)
2. Write VFL to constraint UI components
3. Add VFL constraints to UI components

#Demo
Suppose we have a login UI page with two textfields (username, password) and two buttons (login, register)
