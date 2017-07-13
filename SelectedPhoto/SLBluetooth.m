//
//  SLBluetooth.m
//  SelectedPhoto
//
//  Created by 收付宝－胜利 on 16/6/16.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import "SLBluetooth.h"

#import <CoreBluetooth/CoreBluetooth.h>


@interface SLBluetooth () <CBCentralManagerDelegate,CBPeripheralDelegate> {
    
    NSMutableArray *peripheralArray;
}

@property (nonatomic, strong) CBCentralManager *cbCentralMgr;   //!< 蓝牙管理者

@end

@implementation SLBluetooth


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    peripheralArray = [NSMutableArray array];
    
    
    [self managre];
    
    NSMutableArray * Identifiers = [NSMutableArray array];
    
    for (CBPeripheral * peripheral in peripheralArray) {
        
        [Identifiers addObject:peripheral.identifier];
        
    }
    
    
//    [self addLog:@"[self.cbCentralMgr retrievePeripheralsWithIdentifiers:self.PeripheralIdentifiers]"];
    NSArray *retrievePeripherals = [NSArray array];
    retrievePeripherals = [self.cbCentralMgr retrievePeripheralsWithIdentifiers:Identifiers];
    
    for (CBPeripheral* peripheral in retrievePeripherals) {
        
        NSLog(@"%@",[NSString stringWithFormat: @"%@ name:%@",peripheral,peripheral.name]);
        
    }
    
//    [self.tableViewPeripheral reloadData];
}

- (void)managre {
    
    self.cbCentralMgr = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
//    [self.cbCentralMgr scanForPeripheralsWithServices:nil options:nil];
    
    self.cbCentralMgr.delegate = self;
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false],CBCentralManagerScanOptionAllowDuplicatesKey, nil];
//    + (CBUUID *)UUIDWithString:(NSString *)theString
    [self.cbCentralMgr scanForPeripheralsWithServices:@[[CBUUID UUIDWithString:@"MP100"]] options:dic];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    
    [self.cbCentralMgr connectPeripheral:peripheral options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnDisconnectionKey]];

}


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
    
    [peripheral discoverServices:nil];
    
    for (CBService* service in peripheral.services) {
        
        NSLog(@"%@",service);
        [peripheral discoverCharacteristics:nil forService:service];
    }
}


- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    
    for (CBCharacteristic * characteristic in service.characteristics) {
        
//        [peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
    }
}


- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    
    
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    
}




- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
    
}


- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict {
    
    
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    
}
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    
}


@end
