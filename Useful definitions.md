# Help for understanding Roku brightscript.

__.m__==

__roUrlTransfer__==transfers data safe to or from remote servers specified by URLs
used to ensure all network traffic is handled asynchronously
Can only be used in a Task node
This object is created with no parameters { CreateObject("roUrlTransfer") }.

__RetainBodyOnError__=If retain is true, return the body of the response even if the HTTP status code indicates that an error occurred {get a retain as boolean} [in my case i call it with true because]

__roMessagePort__== is the place messages (events) are sent.
This object is created with no parameters { CreateObject("roMessagePort") }.
This can be used when the SceneGraph application is launched, but not within the application component scripts

__setCertificatesFile__==Set the certificates file used for SSL(Secure Sockets Layer)

__InitClientCertificates__== Initialize the object to send the Roku client certificate. (boolean)

__enablehostverification__== Verify that the certificate belongs to the host(boolean) [interprets enable as a Boolean].

__enablepeerverification__== Verify the certificate has a chain of trust up to a valid root [ rooting gives the ability (or permission) to alter or replace system applications and settings ]

__roSGScreenEvent__== roSGScreenEvents are events sent to a scene graph roSGScreen by the framework [in my case i get message from port and chack if screen is closed]

__wait__== This function waits on objects that are "waitable" (those that have a MessagePort interface).
Wait() returns the event object that was posted to the message port.
If timeout is zero, "wait" will wait for ever.
Otherwise, Wait will return after timeout milliseconds if no messages are received.
In this case, Wait returns a type "invalid".
