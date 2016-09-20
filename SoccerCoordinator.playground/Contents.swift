//: Playground - noun: a place where people can play


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// First, creating the Dictionary collection for all 
//players,upon correcting from previous submission
////////////////////////////////////////////////////////
let player1: [String: Any] = ["playerName":"Joe Smith","heightInInches":42,"hasPlayedBefore":true,"guardianNames":"Jim and Jan Smith"]
let player2: [String: Any] = ["playerName":"Jill Tanner","heightInInches":36,"hasPlayedBefore":true,"guardianNames":"Clara Tanner"]
let player3: [String: Any] = ["playerName":"Bill Bon","heightInInches":43,"hasPlayedBefore":true,"guardianNames":"Sara and Jenny Bon"]
let player4: [String: Any] = ["playerName":"Eva Gordon","heightInInches":45,"hasPlayedBefore":false,"guardianNames":"Wendy and Mike Gordon"]
let player5: [String: Any] = ["playerName":"Matt Gill","heightInInches":40,"hasPlayedBefore":false,"guardianNames":"Charles and Sylvia Gill"]
let player6: [String: Any] = ["playerName":"Kimmy Stein","heightInInches":41,"hasPlayedBefore":false,"guardianNames":"Bill and Hillary Stein"]
let player7: [String: Any] = ["playerName":"Sammy Adams","heightInInches":45,"hasPlayedBefore":false,"guardianNames":"Jeff Adams"]
let player8: [String: Any] = ["playerName":"Karl Saygan","heightInInches":42,"hasPlayedBefore":true,"guardianNames":"Heather Bledsoe"]
let player9: [String: Any] = ["playerName":"Suzane Greenberg","heightInInches":44,"hasPlayedBefore":true,"guardianNames":"Henrietta Dumas"]
let player10: [String: Any] = ["playerName":"Sal Dali","heightInInches":41,"hasPlayedBefore":false,"guardianNames":"Gala Dali"]
let player11: [String: Any] = ["playerName":"Joe Kavalier","heightInInches":39,"hasPlayedBefore":false,"guardianNames":"Sam and Elaine Kavalier"]
let player12: [String: Any] = ["playerName":"Ben Finkelstein","heightInInches":44,"hasPlayedBefore":false,"guardianNames":"Aaron and Jill Finkelstein"]
let player13: [String: Any] = ["playerName":"Diego Soto","heightInInches":41,"hasPlayedBefore":true,"guardianNames":"Robin and Sarika Soto"]
let player14: [String: Any] = ["playerName":"Chloe Alaska","heightInInches":47,"hasPlayedBefore":false,"guardianNames":"David and Jamie Alaska"]
let player15: [String: Any] = ["playerName":"Arnold Willis","heightInInches":43,"hasPlayedBefore":false,"guardianNames":"Claire Willis"]
let player16: [String: Any] = ["playerName":"Phillip Helm","heightInInches":44,"hasPlayedBefore":true,"guardianNames":"Thomas Helm and Eva Jones"]
let player17: [String: Any] = ["playerName":"Les Clay","heightInInches":42,"hasPlayedBefore":true,"guardianNames":"Wynonna Brown"]
let player18: [String: Any] = ["playerName":"Herschel Krustofski","heightInInches":45,"hasPlayedBefore":true,"guardianNames":"Hyman and Rachel Krustofski"]
// and entire league array of dictionary
var theLeague:[[String:Any]] = [player1,player2,player3,player4,player5,player6,player7,player8,player9,player10,player11,player12,player13,player14,player15,player16,player17,player18]

////////////////////////////////////////////////////////
// Now, we create array of Dictionary for each three teams
////////////////////////////////////////////////////////
var teamDragons = [[String:Any]]()
var teamSharks = [[String:Any]]()
var teamRaptors = [[String:Any]]()
let numberOfTeam = 3

var experiencedPlayers = [[String:Any]]()
var nonExperiencedPlayers =  [[String:Any]]()
let numberOfPlayersPerTeam = theLeague.count / numberOfTeam

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Assigning the experienced and non experienced
////////////////////////////////////////////////////////

for player in theLeague {
    
    let withExperienced = player["hasPlayedBefore"] as! Bool

    if withExperienced == true {
        experiencedPlayers.append(player)
    } else {
        nonExperiencedPlayers.append(player)
    }
    
}



////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// creating a sort of closure type in form of function
//for the purpose of sortInPlace method.
////////////////////////////////////////////////////////
func returningAverageHeightOfTeam(nameOfTeam: [[String:Any]])-> Float{
    var totalHeight = 0
    for height in nameOfTeam {
         totalHeight += height["heightInInches"] as! Int
    }
    return Float(totalHeight) / Float(nameOfTeam.count)
   
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// creating a sort of closure type in form of function 
//for the purpose of sortInPlace method.
////////////////////////////////////////////////////////

func closureForSortingBigToSmall(firstPlayer: [String:Any], secondPlayer: [String:Any])-> Bool{
    let one = firstPlayer["heightInInches"] as! Int
    let two = secondPlayer["heightInInches"] as! Int
    
    return one > two
}

func closureForSortingSmallToBig(firstPlayer: [String:Any], secondPlayer: [String:Any])-> Bool{
    let one = firstPlayer["heightInInches"] as! Int
    let two = secondPlayer["heightInInches"] as! Int
    
    return one < two
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
//Sorting the experienced player and inexperienced players
////////////////////////////////////////////////////////


    //this is actually from the feedback from first submission,where the reviewer says that i should "sort first the collection of experienced in one direction and the experienced to other direction."
    // I think this is based on ordered statistics maybe,but i'm not sure. By doing this, the statistics of the subsets is actually the same with the average of the whole set.
    //damn clever!

experiencedPlayers.sortInPlace(closureForSortingBigToSmall)

nonExperiencedPlayers.sortInPlace(closureForSortingSmallToBig)


// Assigning experienced players and inexperience Players to the team

//experienced:
var pseudoStoringExperiencedPlayers = experiencedPlayers
var counter1 = true
var counter2 = true
var counter3 = true
while  pseudoStoringExperiencedPlayers.count != 0 {
    var assigningPlayer = pseudoStoringExperiencedPlayers[0]
    
    if (counter1){
        teamDragons.append(assigningPlayer)
        pseudoStoringExperiencedPlayers.removeAtIndex(0)
        counter1 = false
        counter2 = true
        counter3 = false
    } else if (counter2 ){
        teamRaptors.append(assigningPlayer)
        pseudoStoringExperiencedPlayers.removeAtIndex(0)
        counter1 = false
        counter2 = false
        counter3 = true
    } else if (counter3){
        teamSharks.append(assigningPlayer)
        pseudoStoringExperiencedPlayers.removeAtIndex(0)
        counter1 = true
        counter2 = false
        counter3 = false
    }
}
// nonExperienced:
var pseudoStoringNonExperiencedPlayers = nonExperiencedPlayers
var counter4 = true
var counter5 = true
var counter6 = true
while  pseudoStoringNonExperiencedPlayers.count != 0 {
    var assigningPlayer = pseudoStoringNonExperiencedPlayers[0]
    
    if (counter4){
        teamDragons.append(assigningPlayer)
        pseudoStoringNonExperiencedPlayers.removeAtIndex(0)
        counter4 = false
        counter5 = true
        counter6 = false
    } else if (counter5 ){
        teamRaptors.append(assigningPlayer)
        pseudoStoringNonExperiencedPlayers.removeAtIndex(0)
        counter4 = false
        counter5 = false
        counter6 = true
    } else if (counter6){
        teamSharks.append(assigningPlayer)
        pseudoStoringNonExperiencedPlayers.removeAtIndex(0)
        counter4 = true
        counter5 = false
        counter6 = false
    }
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
//Printing the Letter///////////////////////////////////
////////////////////////////////////////////////////////
let theWholeTeams = [teamDragons, teamSharks, teamRaptors]
let teamNameLiteral = ["Team Dragons","Team Sharks","Team Raptors"]
let teamPracticeDatesLiteral=["March 17, 1pm","March 17, 3pm","March 18, 1pm"]

for player in 0..<theWholeTeams.count {
    var extractingPlayer = theWholeTeams[player]
    for teamName in extractingPlayer{
        var messageBody = "Dear \(teamName["guardianNames"] as! String).\n" +
            " \t\(teamName["playerName"]as! String) is assigned for \(teamNameLiteral[player]) for the soccer game. This team has to meet up on \(teamPracticeDatesLiteral[player]). We are expecting \(teamName["playerName"] as! String) to be on time for this first team practice, so don't forget to remind your child! Looking forward to seeing \(teamName["playerName"] as! String) \n Thank you."
        //Print the message. This was missing in the previous submission. Sorry!!!
        print(messageBody)
    }
}
