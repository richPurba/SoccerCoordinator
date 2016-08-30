//: Playground - noun: a place where people can play

var nameRecord = ["Joe Smith","Jill Tanner","Bill Bon","Eva Gordon","Matt Gill","Kimmy Stein","Sammy Adams","Karl Saygan","Suzane Greenberg","Sal Dali","Joe Kavalier","Ben Finkelstein","Diego Soto","Chloe Alaska","Arnold Willis","Phillip Helm","Les Clay","Herschel Krustofski"]
var heightRecord = [42,36,43,45,40,41,45,42,44,41,39,44,41,47,43,44,42,45]

var soccerExperienceRecord  = [true, true, true, false, false, false, false, true, true, false, false, false,true,false,false,true,true,true]
var guardianNameRecord = ["Jim and Jan Smith","Clara Tanner","Sara nd Jenny Bon","Wendy and Mike Gordon","Charles and Sylvia Gill","Bill and Hillary Stein","Jeff Adams","Heather Bledsoe","Henrietta Dumas","Gala Dali","Sam and Elaine Kavalier","Aaron and Jill Finkelstein","Robin and Sarika Soto","David and Jamie Alaska","Claire Willis","Thomas Helm and Eva Jones","Wynonna Brown","Hyman and Rachel Krustofski"]

let numberOfData = nameRecord.count//checking the number of inputs for name
heightRecord.count//checking for height
soccerExperienceRecord.count//checking for soccerExperienceRecord
guardianNameRecord.count


func returningSoccerExperience(input: String)-> Bool{
    var nameMatched = ""
    var indexRecordForFunction = 0
    for index in 0..<numberOfData{
        if input == nameRecord[index]{
             nameMatched  = input
             indexRecordForFunction = index
        }
    }
    switch input{
        
        
    case nameMatched : return soccerExperienceRecord[indexRecordForFunction]
    default : return false// the return is ambiguous here..
    }
}
returningSoccerExperience("Eva Gordon")//testing
