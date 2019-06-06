sub init()
    m.top.functionName = "execute"
end sub

function execute() as void
    NUMBER_OF_ELEMENTS = 5
    m.top.rankListContent = createRankList(NUMBER_OF_ELEMENTS)
end function

function createRankList(numberOfElements as Integer) as Object
    rankNode = createObject("roSgNode", "contentNode")
    for index=1 to numberOfElements
        rankContentNode = createRankContentNode(index)
        rankNode.appendChild(rankContentNode)
    end for

    return rankNode
end function

function createRankContentNode(index as Integer) as Object
    rank_node = createObject("roSgNode", "rank_node")
    rate = index.toStr()
    rank_node.title = Substitute("Rate: {0}", rate)

    return rank_node
end function
