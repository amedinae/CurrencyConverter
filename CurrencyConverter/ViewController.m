//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Andres Felipe Medina Ealo on 30/05/21.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *MXNlabel;
@property (weak, nonatomic) IBOutlet UILabel *EURlabel;
@property (weak, nonatomic) IBOutlet UILabel *GBPlabel;

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
        double MXNvalue = inputValue * currencies.MXN;
        double EURvalue = inputValue * currencies.EUR;
        double GBPvalue = inputValue * currencies.GBP;
        
        NSString *temp1 = [NSString stringWithFormat:@"%.2f", MXNvalue];
        NSString *temp2 = [NSString stringWithFormat:@"%.2f", EURvalue];
        NSString *temp3 = [NSString stringWithFormat:@"%.2f", GBPvalue];
        self.MXNlabel.text = temp1;
        self.EURlabel.text = temp2;
        self.GBPlabel.text = temp3;
}
@end
