MiniViper is an Adaptation of TODO Viper Demo App. This one is meant to display inter-module communication and includes and external call to data (which could be a json response from a WebService instead of a file).

The Entities and Interactors are build in Swift and the Presenter, Views and Router are in Objective-C.

The AppDependies class is meant to do all the manual labour for all the Wireframes, Interactors, Presenters and ViewControllers. It is meant to make sure there are no cyclic references

The Groups (V,I,P,E,R) communicate via Protocols and the Common group is a common access area.

Inter Module Communication (List and Details) is done via NSNotification. I am sure there is a more elegant way to do this, but we stick to notifications for now (and it is working fine)
