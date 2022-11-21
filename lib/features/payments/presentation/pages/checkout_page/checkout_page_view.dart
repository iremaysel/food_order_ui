import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_ui/features/payments/presentation/cubit/cubit/stepper_cubit.dart';

import '../../../../products/presentation/pages/home_page/components/colors.dart';
import '../../../../products/presentation/pages/home_page/components/size_config.dart';
import '../success_page/success_page_view.dart';
import 'components/checkout_textfield.dart';
import 'components/page_name.dart';
import 'widgets/address.dart';
import 'widgets/final_resume.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({Key? key}) : super(key: key);

  List<Step> getSteps(int currentStep) => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(
            "Direccion",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: const Address(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(
            "Pago",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: const PaymentTabBars(),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(
            "Orden Final",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: const FinalResume(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepperCubit(),
      child: BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) {
          if (state.isLastStep) {
            return const CheckCart();
          } else {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    "Checkout",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  elevation: 0,
                ),
                body: Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(primary: buttonColor)),
                    child: Stepper(
                      type: StepperType.horizontal,
                      steps: getSteps(state.currentStep),
                      currentStep: state.currentStep,
                      onStepContinue: () {
                        if (state.currentStep == 2) {
                          //TODO: aqui hacer la peticion al backend

                        }
                        context.read<StepperCubit>().stepContinue();
                      },
                      onStepTapped: (step) =>
                          context.read<StepperCubit>().steptap(step),
                      onStepCancel: () {
                        context.read<StepperCubit>().stepBack();
                      },
                      controlsBuilder:
                          (BuildContext context, ControlsDetails controls) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight! / 68.3),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: controls.onStepContinue,
                                  child: Container(
                                    height: SizeConfig.screenHeight! / 13.66,

                                    /// 50.0
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Center(
                                      child: Text(
                                        state.currentStep == 2
                                            ? "Confirm"
                                            : "Next",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: SizeConfig.screenHeight! /
                                                37.95,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth! / 34.25,
                              ),

                              /// 12.0
                              if (state.currentStep != 0)
                                Expanded(
                                  child: InkWell(
                                    onTap: controls.onStepCancel,
                                    child: Container(
                                      height: SizeConfig.screenHeight! / 13.66,

                                      /// 50.0
                                      decoration: BoxDecoration(
                                          color: buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Center(
                                        child: Text(
                                          "Back",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  SizeConfig.screenHeight! /
                                                      37.95,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),

                                      /// 18
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    )));
          }
        },
      ),
    );
  }
}

class PaymentTabBars extends StatelessWidget {
  const PaymentTabBars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Text('Seleccione el metodo de pago',
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 8,
            child: TabBar(
              labelPadding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 1.2),
              splashBorderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.blockSizeVertical! * 1)),
              labelStyle:
                  TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 5),
              indicator: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        offset: Offset(0, 2)),
                  ],
                  border: Border.all(color: buttonColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeVertical! * 1))),
              tabs: const [
                Tab(
                  child: Text('Transferencia'),
                ),
                Tab(
                  child: Text('Efectivo'),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical! * 60,
            child: const TabBarView(children: [
              _TranferenciaTabBody(),
              _EfectivoBody(),
            ]),
          )
        ],
      ),
    );
  }
}

class _EfectivoBody extends StatelessWidget {
  const _EfectivoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Text(
          'En caso del pago en efectivo se le llamara a su numero de telefono proporcionado para completar la compra. Si decea puede verificar el numero de telefono a continuacion  ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.blockSizeVertical! * 1.9,
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        const LabelName(textName: "Verificar Numero de Telefono"),
        const CheckoutTextField(
          enterText: "Verifique su Numero de Telefono",
          sizewidth: 1.18,
        ),
      ],
    ));
  }
}

class _TranferenciaTabBody extends StatelessWidget {
  const _TranferenciaTabBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          const LabelName(textName: "Tarjeta Destino"),
          Container(
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 2),
            decoration: BoxDecoration(
                border: Border.all(color: buttonColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeVertical! * 1.5))),
            child: SelectableText(
              '9204 0699 9419 1229',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical! * 3,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Text(
            'A continuacion debe subir una imagen con la confirmacion de pago donde se vea claro el codigo de confirmacion de la transaccion.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeVertical! * 1.9,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Container(
            height: SizeConfig.blockSizeHorizontal! * 40,
            decoration: BoxDecoration(
                border: Border.all(color: buttonColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeVertical! * 1.5))),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO: Hacer lo de Subir la foto.
                Text(
                  'Seleccione la imagen',
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2.5),
                ),
                Icon(
                  Icons.backup_outlined,
                  size: SizeConfig.blockSizeVertical! * 6,
                  color: buttonColor,
                )
              ],
            )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          const LabelName(textName: "Codigo de Transaccion"),
          const CheckoutTextField(
            enterText: "Codigo de Transaccion",
            sizewidth: 1.18,
          ),
        ],
      ),
    );
  }
}
