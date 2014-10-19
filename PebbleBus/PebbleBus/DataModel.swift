
class DataModel: NSObject {
    
    var buses = BusesETA()
    var pebble = PebbleConnection()
    
    override init() {
        super.init()
    }
    
    func sendDisplayDataToPebble() {
        self.sendStopName()
        self.sendNumOfBuses()
        self.sendAverageTimes()
        self.sendBusIndices()
    }
    
    private func sendStopName() {
        let busStop = buses.getClosestStop()
        
        let stopNameDict = [0: busStop.stopName]
        
        pebble.sendDictionary(stopNameDict)
        
        println("Sent the Pebble the dictionary of stop names!")
    }
    
    private func sendNumOfBuses() {
        let numBusesDict = [0: buses.etaList.count]
        
        pebble.sendDictionary(numBusesDict)
        
        println("Sent the Pebble the number of buses!")
    }
    
    private func sendAverageTimes() {

        var i = 0
        
        var averageTimeDict = Dictionary<Int, Int>()
        
        for bus in self.buses.etaList {
            averageTimeDict[i] = bus.average
            i++
        }
        
        pebble.sendDictionary(averageTimeDict)
        
        println("Sent the Pebble the expected wait times!")
    }
    
    private func sendBusIndices() {
        
        var i = 0
        
        var busIndices = Dictionary<Int, Int>()
        
        for bus in self.buses.etaList {
            
            var busIndex = 0
            
            for (busID, busName) in bus.busNames {
                if busName == bus.busName {
                    busIndices[i] = busIndex
                }
                
                busIndex++
            }
            
            i++
        }
        
        pebble.sendDictionary(busIndices)
        
        println("Sent the Pebble the bus indices!")
    }
    
}