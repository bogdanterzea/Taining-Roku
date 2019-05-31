#Help for understanding Roku brightscript.

.m==

roUrlTransfer=transfers data safe to or from remote servers specified by URLs
used to ensure all network traffic is handled asynchronously
Can only be used in a Task node
This object is created with no parameters { CreateObject("roUrlTransfer") }.

RetainBodyOnError=

roMessagePort== is the place messages (events) are sent.
This object is created with no parameters { CreateObject("roMessagePort") }.
This can be used when the SceneGraph application is launched, but not within the application component scripts

setCertificatesFile

InitClientCertificates== Initialize the object to send the Roku client certificate. (boolean)

enablehostverification== Verify that the certificate belongs to the host(boolean) [interprets enable as a Boolean].

enablepeerverification== Verify the certificate has a chain of trust up to a valid root [ rooting gives the ability (or permission) to alter or replace system applications and settings ]

roSGScreenEvent== roSGScreenEvents are events sent to a scene graph roSGScreen by the framework [in my case i get message from port and chack if screen is closed]

wait== This function waits on objects that are "waitable" (those that have a MessagePort interface).
Wait() returns the event object that was posted to the message port.
If timeout is zero, "wait" will wait for ever.
Otherwise, Wait will return after timeout milliseconds if no messages are received.
In this case, Wait returns a type "invalid".
