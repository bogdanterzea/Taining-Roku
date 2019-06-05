sub init()
    m.top.functionName = "execute"
end sub

function execute() as Void
    content_node_data = ParseJson(getDataFromUrl("https://jsonplaceholder.typicode.com/photos"))
    m.top.categoryListContent = createCategoryListContent(content_node_data)
end function

function getDataFromUrl(url as String) as String
    data_request = createObject("roUrlTransfer")
    data_request.setUrl(url)
    data_request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    data_request.InitClientCertificates()

    body_data = data_request.getToString()
    return body_data
end function

function createCategoryListContent(data as Object) as Object
    contentNode = createObject("roSGNode","ContentNode")
    for each itemData in data
        categoryNode = createCategoryNode(itemData)
        contentNode.appendChild(categoryNode)
    end for

    return contentNode
end function

function createCategoryNode(itemData as Object) as Object
    category_node = createObject("roSGNode", "category_node")
    category_node.title = itemData.title
    category_node.feed_url = itemData.url
    category_node.rank = rnd(5)

    return category_node
end function
