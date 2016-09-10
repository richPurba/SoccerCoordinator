//: Playground - noun: a place where people can play
import Darwin
var nameRecord = ["Joe Smith","Jill Tanner","Bill Bon","Eva Gordon","Matt Gill","Kimmy Stein","Sammy Adams","Karl Saygan","Suzane Greenberg","Sal Dali","Joe Kavalier","Ben Finkelstein","Diego Soto","Chloe Alaska","Arnold Willis","Phillip Helm","Les Clay","Herschel Krustofski"]
var heightRecord = [42,36,43,45,40,41,45,42,44,41,39,44,41,47,43,44,42,45]

var soccerExperienceRecord  = [ true, true,true, false, false, false, false, true, true, false, false, false,true,false,false,true,true,true]
var guardianNameRecord = ["Jim and Jan Smith","Clara Tanner","Sara nd Jenny Bon","Wendy and Mike Gordon","Charles and Sylvia Gill","Bill and Hillary Stein","Jeff Adams","Heather Bledsoe","Henrietta Dumas","Gala Dali","Sam and Elaine Kavalier","Aaron and Jill Finkelstein","Robin and Sarika Soto","David and Jamie Alaska","Claire Willis","Thomas Helm and Eva Jones","Wynonna Brown","Hyman and Rachel Krustofski"]

let numberOfData = nameRecord.count//checking the number of inputs for name
heightRecord.count//checking for height
soccerExperienceRecord.count//checking for soccerExperienceRecord
guardianNameRecord.count//checking for guardianNameRecord


func returningSoccerExperience(playerName: String)-> Bool{
    var nameMatch = ""
    var indexRecordForFunction = 0
    for index in 0..<numberOfData{
        if playerName == nameRecord[index]{
             nameMatch  = playerName
             indexRecordForFunction = index
        }
    }
    switch playerName{
    case nameMatch : return soccerExperienceRecord[indexRecordForFunction]
    default : return false// the return is ambiguous here..
    }
}// end of function

returningSoccerExperience("Eva Gordon")//testing

////////////////////////////////////////////
/////////Assigning to Team//////////////////
///////////////////////////////////////////

//Counting and Assigning Experienced players and Assigning Non-Experienced Players to different arrays
var countingExperiencedPlayer = 0
var countingNonExperiencedPlayer = 0
var storingExperiencedPlayers = [String]()
var storingNonExperiencedPlayers = [String]()
for index in 0..<numberOfData {
    
    if returningSoccerExperience(nameRecord[index]) == true {
        countingExperiencedPlayer += 1
        storingExperiencedPlayers.append(nameRecord[index])
    } else {
        countingNonExperiencedPlayer += 1
        storingNonExperiencedPlayers.append(nameRecord[index])
    }
}

var teamDragon = [String]()
var teamSharks = [String]()
var teamRaptors = [String]()
let numberOfTeam = 3 // this is an input

//creating a divisor so that the number
let divisorOfExperiencedPlayers = countingExperiencedPlayer/numberOfTeam


if divisorOfExperiencedPlayers == 0{ print("The number of experienced player is not divisible by the number of team: ",numberOfTeam)}
else {
     
    /// putting the experienced players randomly
    while storingExperiencedPlayers.count != 0 {
        var pickingThePlayerFromRecord = storingExperiencedPlayers[0]//picking always the first index
        
        var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
        if ((countingRandomPick == 1) && (teamDragon.count < divisorOfExperiencedPlayers) ){
            teamDragon.append(pickingThePlayerFromRecord)
            storingExperiencedPlayers.removeAtIndex(0)//deleting always the first index after restoring it
        }
        else if  ((countingRandomPick == 2 ) && (teamSharks.count < divisorOfExperiencedPlayers)) {
            teamSharks.append(pickingThePlayerFromRecord)
            storingExperiencedPlayers.removeAtIndex(0)//deleting always the first index after restoring it
        }
        else if ((countingRandomPick == 3) && (teamRaptors
            .count < divisorOfExperiencedPlayers)){
            teamRaptors.append(pickingThePlayerFromRecord)
            storingExperiencedPlayers.removeAtIndex(0)//deleting always the first index after restoring it
        }
        //storingExperiencedPlayers.removeAtIndex(0) is put at every branch so that the while loop can search until a number of iterations so that every team is filled equally
        
    }// end of putting the experienced players randomly
    teamRaptors
    var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
    
    let divisorOfNonExperiencedPlayers = countingNonExperiencedPlayer/numberOfTeam
    
    while storingNonExperiencedPlayers.count != 0 {
        
        var pickingThePlayerFromRecord = storingNonExperiencedPlayers[0]
        
        var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
        
        if((countingRandomPick == 1) && (teamDragon.count <= teamDragon.count + divisorOfNonExperiencedPlayers)){
            teamDragon.append(pickingThePlayerFromRecord)
            storingNonExperiencedPlayers.removeAtIndex(0)
        }else if((countingRandomPick == 2) && (teamSharks.count <= teamSharks.count + divisorOfNonExperiencedPlayers)){
            teamSharks.append(pickingThePlayerFromRecord)
            storingNonExperiencedPlayers.removeAtIndex(0)
        }else if((countingRandomPick == 3) && (teamRaptors.count <= teamRaptors.count + divisorOfNonExperiencedPlayers)){
            teamRaptors.append(pickingThePlayerFromRecord)
            storingNonExperiencedPlayers.removeAtIndex(0)
        }
        
        
    }

 }


func returningAverageHeightOfTeam(nameOfTeam: [String])-> Float{
    var heightOfIndividual = [Int]()
    
    for index in 0..<nameOfTeam.count{
        var matchingValues = nameOfTeam[index]
        
        for index2 in 0..<nameRecord.count{
            if matchingValues == nameRecord[index2]{
                heightOfIndividual.append(heightRecord[index2])
            }
            
        }// end of for level 2
        
        
    }// end of for level 1
    //averaging
    var accumulatingValues : Float = 0.0
    for index3 in 0..<heightOfIndividual.count{
        
        accumulatingValues = accumulatingValues + Float(heightOfIndividual[index3])
    }
    
    return accumulatingValues / Float(heightOfIndividual.count)
}


returningAverageHeightOfTeam(teamDragon)
returningAverageHeightOfTeam(teamSharks)
returningAverageHeightOfTeam(teamRaptors)
