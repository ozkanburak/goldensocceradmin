import 'package:firenase_crud2/controllers/users_controller.dart';
import 'package:firenase_crud2/models/users_model.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class HighEdit extends StatefulWidget {
  final UserModel? user;
  final index;
  const HighEdit({super.key, this.user, this.index});

  @override
  State<HighEdit> createState() => _HighEditState();
}

class _HighEditState extends State<HighEdit> {
   static final formkey = GlobalKey<FormState>(); //formlardan gelen keyleri kontrol etmek için
  bool isEditingMode = false; //add mi upgrade mi olmasını kontrol etmek için
  final TextEditingController idController = TextEditingController(); //text controllerlar
  final TextEditingController durumController = TextEditingController();
  final TextEditingController oranController = TextEditingController();
  final TextEditingController tahminController = TextEditingController();
  final TextEditingController macController = TextEditingController();
  final TextEditingController ulkeController = TextEditingController();
   final TextEditingController zamanController = TextEditingController();

  @override
  void initState() {
    //bu kısımda edit iconuna basında bastığımız veri gelsin diye yapıldı
    if (widget.index != null) {
      isEditingMode = true;
      idController.text = widget.user!.id!;
      durumController.text = widget.user!.durum.toString();
      oranController.text = widget.user!.oran.toString();
      tahminController.text = widget.user!.tahmin.toString();
      macController.text = widget.user!.mac.toString();
      ulkeController.text = widget.user!.ulke.toString();
      zamanController.text = widget.user!.zaman.toString();
    } else {
      isEditingMode = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        //update modu mu add modu mu kontrol
        title: isEditingMode == true ? const Text('Golden Betting Admin 2 ') : const Text('Golden Betting Admin'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Durum',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Durum',
                      myController: durumController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Oran',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Oran',
                      myController: oranController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Tahmin',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Tahmin',
                      myController: tahminController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Mac',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Mac',
                      myController: macController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Ulke',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Ulke',
                      myController: ulkeController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Zaman',
                      icons: const Icon(Icons.numbers),
                      labelText: 'Zaman',
                      myController: zamanController,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        //keyler kontrol edip saveledik
                        //formkey.currentState!.save();
                        if (isEditingMode == true) {
                          //Mode true ise update
                          UsersController4().updateUsers(
                            //update yaptıgımız yer usermodelin içinden vektik
                            UserModel(
                              //username ve age kısmına controller texti yazdırdık
                              durum: durumController.text,
                              oran: oranController.text,
                              tahmin: tahminController.text,
                              mac: macController.text,
                              ulke: ulkeController.text,
                              zaman: zamanController.text,
                              id: idController.text,
                            ),
                          );
                        } else {
                          //değilse add işlemi yapıyoruz
                          UsersController4().addUsers(
                            UserModel(
                              //username ve age kısmına controller texti yazdırdık
                              durum: durumController.text,
                              oran: oranController.text,
                              tahmin: tahminController.text,
                              mac: macController.text,
                              ulke: ulkeController.text,
                              zaman: zamanController.text,
                            ),
                          );
                        }
                      }
                      Navigator.pop(context);
                    },
                    child: isEditingMode == true ? const Text('Update') : const Text('Save')),
              ),
            )
          ],
        ),
      )),
    );
  }
}
