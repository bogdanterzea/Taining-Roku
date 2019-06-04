sub init()
    m.top.functionName = "execute"
end sub

function execute() as Void
    m.top.response = getDataFromUrl("https://jsonplaceholder.typicode.com/photos")
end function

function getDataFromUrl(url as String) as Object
    data_request = createObject("roUrlTransfer")
    data_request.setUrl(url)

    data_request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    data_request.InitClientCertificates()

    body_data = data_request.getToString()

    return body_data
end function
