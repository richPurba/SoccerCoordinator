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

// function of average of team's heights

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
}// end of function


// Defining variables of teams, number of team and constant ot Threshold
var teamDragon = [String]()
var teamSharks = [String]()
var teamRaptors = [String]()
let numberOfTeam = 3 // this is an input
let thresholdOfHeight: Float = 1.5

//creating a divisor so that the division will be evenly distributed
let divisorOfExperiencedPlayers = countingExperiencedPlayer/numberOfTeam

//initializing the threshold logic variables, initializing them higher then the threshold
var differenceAverageHeighetDragonAndSharks: Float = thresholdOfHeight + 1
var differenceAverageHeighetDragonAndRaptors: Float = thresholdOfHeight + 1
var differenceAverageHeighetSharksAndRaptors: Float = thresholdOfHeight + 1

if divisorOfExperiencedPlayers == 0{ print("The number of experienced player is not divisible by the number of team: ",numberOfTeam)}
else {
 
     // creating difference average values of the function
     //starting to make it higher than the threshold first until it is violated (i.e., to make it lower than the threshold)
    
     
    while ((differenceAverageHeighetDragonAndSharks > thresholdOfHeight) || (differenceAverageHeighetDragonAndRaptors > thresholdOfHeight) || (differenceAverageHeighetSharksAndRaptors > thresholdOfHeight)){
        /// putting the experienced players randomly
        for indexAgain in 0..<storingExperiencedPlayers.count {
            var pickingThePlayerFromRecord = storingExperiencedPlayers[indexAgain]//picking always the first index
            
            var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
            if ((countingRandomPick == 1) && (teamDragon.count < divisorOfExperiencedPlayers) ){
                teamDragon.append(pickingThePlayerFromRecord)//deleting always the first index after restoring it
            }
            else if  ((countingRandomPick == 2 ) && (teamSharks.count < divisorOfExperiencedPlayers)) {
                teamSharks.append(pickingThePlayerFromRecord)//deleting always the first index after restoring it
            }
            else if ((countingRandomPick == 3) && (teamRaptors
                .count < divisorOfExperiencedPlayers)){
                teamRaptors.append(pickingThePlayerFromRecord)//deleting always the first index after restoring it
            }
            
        }// end of putting the experienced players randomly
        teamRaptors
        
        let divisorOfNonExperiencedPlayers = countingNonExperiencedPlayer/numberOfTeam
        
         for indexAgain in 0..<storingNonExperiencedPlayers.count {
            
            var pickingThePlayerFromRecord = storingNonExperiencedPlayers[indexAgain]
            
            var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
            
            if((countingRandomPick == 1) && (teamDragon.count <= teamDragon.count + divisorOfNonExperiencedPlayers)){
                teamDragon.append(pickingThePlayerFromRecord)
            }else if((countingRandomPick == 2) && (teamSharks.count <= teamSharks.count + divisorOfNonExperiencedPlayers)){
                teamSharks.append(pickingThePlayerFromRecord)
            }else if((countingRandomPick == 3) && (teamRaptors.count <= teamRaptors.count + divisorOfNonExperiencedPlayers)){
                teamRaptors.append(pickingThePlayerFromRecord)
            }
            
        }
        
        differenceAverageHeighetDragonAndSharks = (abs((returningAverageHeightOfTeam(teamDragon) - returningAverageHeightOfTeam(teamSharks))))
        differenceAverageHeighetDragonAndRaptors = abs(returningAverageHeightOfTeam(teamDragon) - returningAverageHeightOfTeam(teamRaptors))
        differenceAverageHeighetSharksAndRaptors = abs(returningAverageHeightOfTeam(teamSharks) - returningAverageHeightOfTeam(teamRaptors))
        
        }// end of threshold logic
   }
