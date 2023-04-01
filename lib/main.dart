import 'package:carrot/interest_list.dart';
import 'package:carrot/show_profile.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  // runApp(const MaterialApp(home: MyApp())); 중복된 meterialApp선언 불필요함
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // @override
  // Widget build(BuildContext context) {
  //   throw UnimplementedError(); //재정의되지않은 build메소드
  // }
  @override
  Widget build(BuildContext context) {
    //MyApp은 void Main과 MyPage 사이에 MaterialApp을 중계하는 용도로 사용한다.
    //MaterialApp은 여러가지 안드로이드 스타일 편의기능을 재공하는 프레임인데,
    //StateFullWidget 안에 있다면 항상 MaterialApp도 리빌드되어야 하는 문제 발생
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    //MyPage는 MaterialApp위에있기때문에
    //바로 Scaffold를 반환하여 build를 시작해도 된다
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      //현재 body가 리스트의 childern들을 불러오는것만 정의되어있기 때문에
      //한번 더 분리할 필요성은 없어보임.
      body: Container(
        color: Colors.white, //색상통일
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            Column(
              children: [
                profileWidget(context),
                carrotPayWidget(),
                myDealWidget(context),
                myLifeWidget(),
                myBusinessWidget(),
                theOthersWidget()
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBarWidget(),
    );
  }
}

Widget profileWidget(BuildContext context) {
  return Container(
    child: Column(children: [
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/person.jpg"),
          ),
          const Text(
            ('  User_name'),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                // GestureDetector(
                //     onTap: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => showProfile()));
                //     },),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.grey.shade100,
                //       borderRadius: BorderRadius.circular(10)),
                //   child: const Padding(
                //     padding: EdgeInsets.symmetric(
                //       vertical: 10,
                //       horizontal: 30,
                //     ),
                //     child: Text('프로필 보기'),
                    
                //   ),
                // )
              ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>showProfile()));
              },
              style: ElevatedButton.styleFrom(
                // minimumSize: ,
                primary: Colors.grey.shade100,
                onPrimary: Colors.black,
                shadowColor: Colors.transparent
              ),
              
              child: Text('프로필 보기', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
            )
              ],
            )
            )
        ],
      )
    ]),
  );
}

Widget carrotPayWidget() {
  return Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  ' Pay',
                  style: TextStyle(
                      color: Colors.amber.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(right: 200)),
                Text('당근하는 새로운 방법, 당근페이!'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    child: Text('충전'),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    child: Text('계좌송금'),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ],
  ));
}

Widget line() {
  return Container(
    height: 1,
    color: Colors.grey.withOpacity(0.3),
  );
}

Widget myDealWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(('나의 거래'),
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      const SizedBox(
        height: 10,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 균등하게
        children: [
          Row(
            children: [
              Icon(Icons.favorite_border_rounded),
              Expanded(
                child:  GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => interestList())));           
                  },
                child: Container(
                  child: Text(' 관심목록')
                  )
                
                ),

              )
              //Text(' 관심목록'),
            ],
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [Icon(Icons.description_outlined), Text(' 판매내역')],
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [Icon(Icons.shopping_bag_outlined), Text(' 구매내역')],
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [Icon(Icons.note_alt_outlined), Text(' 중고거래 가계부')],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
      line()
    ]),
  );
}

Widget myLifeWidget() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(('나의 동네생활'),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 균등하게
          children: [
            Row(
              children: [Icon(Icons.edit_note), Text(' 동네생활 글/댓글')],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
        line()
      ]));
}

Widget myBusinessWidget() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(('나의 비즈니스'),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 균등하게
          children: [
            Row(
              children: [Icon(Icons.business), Text(' 비즈프로필 관리')],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [Icon(Icons.campaign_outlined), Text(' 광고')],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [Icon(Icons.text_snippet_outlined), Text(' 동네홍보 글')],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
        line()
      ]));
}

Widget theOthersWidget() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(('기타'),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 균등하게
          children: [
            Row(
              children: [Icon(Icons.location_on_outlined), Text(' 내 동네 설정')],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [Icon(Icons.gps_not_fixed), Text(' 동네 인증하기')],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [Icon(Icons.local_offer_outlined), Text(' 알림 키워드 설정')],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(Icons.contact_support_outlined),
                Text(' 자주 묻는 질문')
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [Icon(Icons.markunread_outlined), Text(' 친구초대')],
            )
          ],
        ),
      ]));
}

// Widget bodyWidget() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 15),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         profileWidget(),
//         carrotPayWidget(),
//         myDealWidget(),
//         myLifeWidget(),
//         myBusinessWidget(),
//         theOthersWidget()

//       ],)
//   );
// }

Widget bottomBarWidget() {
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => {},
      currentIndex: 4,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet),
          label: '동네생활',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          label: '내 근처',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer_outlined),
          label: '채팅',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '나의 당근',
        ),
      ]);
}
