import 'package:flutter/material.dart';
import 'package:food_order_ui/view/checkout_page/widgets/address.dart';
import 'package:food_order_ui/view/checkout_page/widgets/payment.dart';
import 'package:food_order_ui/view/home_page/components/colors.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';
import 'package:food_order_ui/view/success_page/success_page_view.dart';

class CheckoutPageView extends StatefulWidget {
  const CheckoutPageView({Key? key}) : super(key: key);

  @override
  _CheckoutPageViewState createState() => _CheckoutPageViewState();
}

class _CheckoutPageViewState extends State<CheckoutPageView> {
  int currentStep = 0;
  bool isCompleted = false;
  List<Step> getSteps() => [
    Step(
      state: currentStep> 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: Text("Address", style: TextStyle(fontSize: 18,),),
      content: Address(),
    ),
    Step(
        state: currentStep> 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text("Complete", style: TextStyle(fontSize: 18,),),
        content: Payment(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Checkout", style: TextStyle(color: buttonColor, fontSize: 22, fontWeight: FontWeight.bold ),),
        elevation: 0,
      ),
      body: isCompleted? CheckCart():
      Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: buttonColor)
        ),
        child: Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              setState(() => isCompleted = true);
              print("Completed");
              /// send data to server
            } else {
              /// code
            }
            setState(() => currentStep += 1);
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel:
          currentStep == 0 ? null : (){
            setState(() => currentStep -= 1);
          },
          controlsBuilder: (BuildContext context, ControlsDetails controls){
            final isLastStep = currentStep == getSteps().length -1;
            return Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight!/68.3),        /// 10.0
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:controls.onStepContinue,
                      child: Container(
                        height: SizeConfig.screenHeight!/13.66,                   /// 50.0
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Center(child: Text(isLastStep ? "Confirm" : "Next", style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight!/37.95, fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth!/34.25,),                /// 12.0
                  if(currentStep != 0)
                    Expanded(
                      child: InkWell(
                        onTap:controls.onStepCancel,
                        child: Container(
                          height: SizeConfig.screenHeight!/13.66,                /// 50.0
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Center(child: Text("Back", style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight!/37.95, fontWeight: FontWeight.bold),),),   /// 18
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        )
      )
    );
  }
}
