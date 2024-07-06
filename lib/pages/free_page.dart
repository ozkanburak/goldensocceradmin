import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firenase_crud2/controllers/users_controller.dart';
import 'package:firenase_crud2/models/users_model.dart';
import 'package:firenase_crud2/pages/add_or_update_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FreePage extends StatefulWidget {
  const FreePage({super.key});

  @override
  State<FreePage> createState() => _FreePageState();
}

class _FreePageState extends State<FreePage> {
  final CollectionReference users = FirebaseFirestore.instance.collection('maclar');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddOrUpdate(
                  user: null,
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
     
      body: SafeArea(
          child: SingleChildScrollView(
            
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                stream: users.snapshots(), //yukarıda firebase firestoredaki user
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    //verileri beklerken indicator gelsin
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    // data gelince ana kısım
                    return Flexible(
                      child: ListView.builder(
                        shrinkWrap: true, // ListView'ın içeriğe göre boyutunu ayarlamasını sağlar
                        physics: const NeverScrollableScrollPhysics(), 
                        itemCount: snapshot.data!.docs.length, //querysnapshot içindeki doc uzunluğu kadar
                        itemBuilder: (context, index) {
                          final DocumentSnapshot list =
                              snapshot.data!.docs[index]; //gelen dataları listeye attık indexini aldık
                          return Card(
                            color: Colors.blueAccent,
                            //slidable CARDIN İÇİNDEKİ VERİYİ SAĞA SOLA KAYDIRINCA İCONLARIN ÇIKTIĞI KOD
                            child: Slidable(
                              direction: Axis.horizontal,
                              useTextDirection: true,
                              startActionPane: ActionPane(motion: const StretchMotion(), children: [
                                SlidableAction(
                                  borderRadius: BorderRadius.circular(15),
                                  onPressed: (context) {
                                    final user = UserModel(
                                      //edit iconuna basında datalar oto gelsin diye
                                      id: list.id,
                                      durum: list['durum'],
                                      oran: list['oran'],
                                      tahmin: list['tahmin'],
                                      mac: list['mac'],
                                      ulke: list['ulke'],
                                      zaman: list['zaman'],
                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddOrUpdate(
                                            user: user,
                                            index: index,
                                          ),
                                        ));
                                  },
                                  icon: Icons.edit,
                                  backgroundColor: Colors.green,
                                ),
                              ]),
                              endActionPane: ActionPane(motion: const StretchMotion(), children: [
                                SlidableAction(
                                  borderRadius: BorderRadius.circular(15),
                                  onPressed: (context) {
                                    //bastığımızda delete yapıyor users modelin içinde delete users
                                    UsersController().deleteUsers(UserModel(id: list.id)); //documentSnapshottan sil
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                ),
                              ]),
                               child: ListTile(
                                title: Text(list[
                                    'mac'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),), 
                                    
                                    
                                    //yukarıdaki gelen dataları liste değişkenine eklemiştik burada gelen veriden username alıyoruz
                                //aynı şeki age aldık
                                //BU ALTTAKİ TRAİLİNG KODU ALTERNATİF SAĞ TARATA CIKAN EDİT VE DELETE İLE DE SİLİNEBİLİR VERİLER
                                //en aşağıya metod olarak çıkardım bakabilirsin
                                //trailing: customTrailing(list, context, index),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
        
      )),
      
    );
  }

  // SizedBox customTrailing(DocumentSnapshot<Object?> list, BuildContext context, int index) {
  //   return SizedBox(
  //       width: 100,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           IconButton(
  //               onPressed: () {
  //                 final user = UserModel(
  //                   id: list.id,
  //                   username: list['username'],
  //                   age: list['age'],
  //                 );
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => AddOrUpdate(
  //                         user: user,
  //                         index: index,
  //                       ),
  //                     ));
  //               },
  //               icon: const Icon(Icons.edit)),
  //           IconButton(
  //               onPressed: () {
  //                 UsersController().deleteUsers(UserModel(id: list.id)); //documentSnapshottan sil
  //               },
  //               icon: const Icon(Icons.delete)),
  //         ],
  //       ));
  // }
}
