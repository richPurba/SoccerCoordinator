//: Playground - noun: a place where people can play
import Darwin
var nameRecord = ["Joe Smith","Jill Tanner","Bill Bon","Eva Gordon","Matt Gill","Kimmy Stein","Sammy Adams","Karl Saygan","Suzane Greenberg","Sal Dali","Joe Kavalier","Ben Finkelstein","Diego Soto","Chloe Alaska","Arnold Willis","Phillip Helm","Les Clay","Herschel Krustofski"]
var heightRecord = [42,36,43,45,40,41,45,42,44,41,39,44,41,47,43,44,42,45]

var soccerExperienceRecord  = [ true, true,true, false, false, false, false, true, true, false, false, false,true,false,false,true,true,true]
var guardianNameRecord = ["Jim and Jan Smith","Clara Tanner","Sara and Jenny Bon","Wendy and Mike Gordon","Charles and Sylvia Gill","Bill and Hillary Stein","Jeff Adams","Heather Bledsoe","Henrietta Dumas","Gala Dali","Sam and Elaine Kavalier","Aaron and Jill Finkelstein","Robin and Sarika Soto","David and Jamie Alaska","Claire Willis","Thomas Helm and Eva Jones","Wynonna Brown","Hyman and Rachel Krustofski"]

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
        var matchingValues = nameOfTeam[index]// not sure why i have to change this to 'let', consider the value will change. Is it because func type?
        
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
var pseudoStoringExperiencedPlayers = storingExperiencedPlayers
var pseudoStoringNonExperiencedPlayers = storingNonExperiencedPlayers

//creating a divisor so that the division will be evenly distributed
let divisorOfExperiencedPlayers = countingExperiencedPlayer/numberOfTeam
let divisorOfNonExperiencedPlayers = countingNonExperiencedPlayer/numberOfTeam
let maximumPlayerPerTeam = nameRecord.count / numberOfTeam

//initializing the threshold logic variables, initializing them higher then the threshold
var differenceAverageHeighetDragonAndSharks: Float = thresholdOfHeight + 1
var differenceAverageHeighetDragonAndRaptors: Float = thresholdOfHeight + 1
var differenceAverageHeighetSharksAndRaptors: Float = thresholdOfHeight + 1

if divisorOfExperiencedPlayers == 0{ print("The number of experienced players is not divisible by the number of team which is \(numberOfTeam)" + "/n Consider to add experienced players a multiple of \(numberOfTeam)")}
else {
 
     // creating difference average values of the function
     //starting to make it higher than the threshold first until it is violated (i.e., to make it lower than the threshold)
     
    while ((differenceAverageHeighetDragonAndSharks > thresholdOfHeight) || (differenceAverageHeighetDragonAndRaptors > thresholdOfHeight) || (differenceAverageHeighetSharksAndRaptors > thresholdOfHeight)){
        /// putting the experienced players randomly
        
        while pseudoStoringExperiencedPlayers.count != 0 {
            var pickingThePlayerFromRecord = pseudoStoringExperiencedPlayers[0]//picking always the first index
            
            var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
            
            if ((countingRandomPick == 1) && (teamDragon.count < divisorOfExperiencedPlayers) ){
                teamDragon.append(pickingThePlayerFromRecord)//deleting always the first index after restoring it
                pseudoStoringExperiencedPlayers.removeAtIndex(0)
            }
            else if  ((countingRandomPick == 2 ) && (teamSharks.count < divisorOfExperiencedPlayers)) {
                teamSharks.append(pickingThePlayerFromRecord)//deleting always the first index after restoring it
                pseudoStoringExperiencedPlayers.removeAtIndex(0)
            }
            else if ((countingRandomPick == 3) && (teamRaptors
                .count < divisorOfExperiencedPlayers)){
                teamRaptors.append(pickingThePlayerFromRecord)//deleting always the first index after restoring it
                pseudoStoringExperiencedPlayers.removeAtIndex(0)
            }
            
        }// end of putting the experienced players randomly
        
        
        // assigning nonExperienced Players
         while pseudoStoringNonExperiencedPlayers.count != 0 {
            
            var pickingThePlayerFromRecord = pseudoStoringNonExperiencedPlayers[0]
            
            var countingRandomPick = Int(arc4random() % uint(numberOfTeam) + 1)
            
            if((countingRandomPick == 1) && (teamDragon.count < maximumPlayerPerTeam)){
                teamDragon.append(pickingThePlayerFromRecord)
                pseudoStoringNonExperiencedPlayers.removeAtIndex(0)
            }else if((countingRandomPick == 2) && (teamSharks.count < maximumPlayerPerTeam)){
                teamSharks.append(pickingThePlayerFromRecord)
                pseudoStoringNonExperiencedPlayers.removeAtIndex(0)
            }else if((countingRandomPick == 3) && (teamRaptors.count < maximumPlayerPerTeam)){
                teamRaptors.append(pickingThePlayerFromRecord)
                pseudoStoringNonExperiencedPlayers.removeAtIndex(0)
            }
            
        }
        //redefining the logic of threshold here, so the violation of the threshold will result in removing the array's values
        
        differenceAverageHeighetDragonAndSharks = (abs((returningAverageHeightOfTeam(teamDragon) - returningAverageHeightOfTeam(teamSharks))))
        differenceAverageHeighetDragonAndRaptors = abs(returningAverageHeightOfTeam(teamDragon) - returningAverageHeightOfTeam(teamRaptors))
        differenceAverageHeighetSharksAndRaptors = abs(returningAverageHeightOfTeam(teamSharks) - returningAverageHeightOfTeam(teamRaptors))
        
        if ((differenceAverageHeighetDragonAndSharks > thresholdOfHeight) || (differenceAverageHeighetDragonAndRaptors > thresholdOfHeight) || (differenceAverageHeighetSharksAndRaptors > thresholdOfHeight)){
            // if the threshold is not satisfied, restart the collection from square one again
            pseudoStoringExperiencedPlayers = storingExperiencedPlayers
            pseudoStoringNonExperiencedPlayers = storingNonExperiencedPlayers
            //removing the team
            teamDragon.removeAll()
            teamSharks.removeAll()
            teamRaptors.removeAll()
        }
        
        }// end of threshold logic
    
    // continue the loop until satisfies the condition
   }

//checking the array

teamDragon.count
teamDragon
teamRaptors.count
teamRaptors
teamSharks.count
teamSharks

//checking the height's difference
differenceAverageHeighetDragonAndSharks
differenceAverageHeighetDragonAndRaptors
differenceAverageHeighetSharksAndRaptors

// function that returns the guardian, copy-pasted from func returningAverageHeightOfTeam()

func returningGuardianOfTeam(nameOfTeam: [String])-> [String]{
    var guardianNameOfIndividual = [String]()
    
    for index in 0..<nameOfTeam.count{
        var matchingValues = nameOfTeam[index]// not sure why i have to change this to 'let', consider the value will change. Is it because func type?
        for index2 in 0..<guardianNameRecord.count{
            if matchingValues == nameRecord[index2]{
                guardianNameOfIndividual.append(guardianNameRecord[index2])
            }
            
        }// end of for level 2
        
        
    }// end of for level 1
    
    return guardianNameOfIndividual
}// end of function

// making dictionary to ease the loop for the letter to the guardian

var dictionaryForTeam  = [0: teamDragon,1:teamSharks,2:teamRaptors]

for index in 0..<numberOfTeam{
    var temporaryIndividualName = dictionaryForTeam[index]!
    // sorry for this, i am aware of the Optional type (to a very minimum extent!), although it hasn't been covered by the lecture so far. 
    // so i have to unwrap it for now.
    var temporaryGuardianName = returningGuardianOfTeam(temporaryIndividualName)
    
    var teamPracticeDatesLiteral = ""
    var nameTeamLiteral = ""
    var messageBody : String = ""
    switch index {
    case 0 : teamPracticeDatesLiteral = "March 17, 1pm"
                nameTeamLiteral = "Team Dragon"
    case 1 : teamPracticeDatesLiteral = "March 17, 3pm"
                nameTeamLiteral = "Team Sharks"
    case 2 :teamPracticeDatesLiteral = "March 18, 1pm"
                nameTeamLiteral = "Team Raptors"
    default : "NOT AVAILABLE"
        
    }
    for id in 0..<temporaryGuardianName.count{
        messageBody = "Dear \(temporaryGuardianName[id]).\n" +
            " \t\(temporaryIndividualName[id]) is assigned for \(nameTeamLiteral) for the soccer game. This team has to meet up at \(teamPracticeDatesLiteral). We are expecting \(temporaryIndividualName[id]) to be on time for this first team practice, so don't forget to remind your child! Looking forward to seeing \(temporaryIndividualName[id]) \n Thank you."
    }
    
}
