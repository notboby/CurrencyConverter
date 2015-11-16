//
//  ViewController.m
//  peerReview3
//
//  Created by Robin Fabre on 15/11/2015.
//  Copyright © 2015 Robin Fabre. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController ()<CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;


@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
   
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    double yenValue = inputValue * currencies.JPY;
    double gbpValue = inputValue * currencies.GBP;
    
    NSString *eur = [NSString stringWithFormat:@"%.2f",euroValue];
    NSString *yen = [NSString stringWithFormat:@"%.2f",yenValue];
    NSString *gbp = [NSString stringWithFormat:@"%.2f",gbpValue];
    
    
    
    self.currencyA.text = eur;
    self.currencyB.text = yen;
    self.currencyC.text = gbp;

    
    
}


@end
