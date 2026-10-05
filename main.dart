import 'package:flutter/material.dart';

void main() => runApp(const SolidariteFinance());

class SolidariteFinance extends StatefulWidget {
  const SolidariteFinance({super.key});
  @override State<SolidariteFinance> createState() => _AppState();
}

class _AppState extends State<SolidariteFinance> {
  String lang = 'fr';
  int tab = 0;

  final Map<String, Map<String, String>> t = {
    'fr': {
      'app':'Solidarité Finance','home':'Accueil','projects':'Projets',
      'request':'Demander','profile':'Profil','title':'Ensemble, finançons les projets qui changent des vies.',
      'text':'Une plateforme pour recevoir une aide, faire un don ou financer un prêt solidaire.',
      'help':'Aider quelqu’un','ask':'Demander un financement','impact':'Notre impact',
      'people':'personnes aidées','find':'Projets à financer','don':'DON','loan':'PRÊT',
      'contribute':'Contribuer','finance':'Financer le prêt','new':'Nouvelle demande',
      'amount':'Montant souhaité','reason':'Motif','description':'Décrivez votre situation',
      'submit':'Soumettre la demande','dashboard':'Mon tableau de bord','payment':'Paiement',
      'pay':'Payer maintenant','method':'Moyen de paiement','secure':'Paiement sécurisé (démo)'
    },
    'en': {
      'app':'Solidarity Finance','home':'Home','projects':'Projects',
      'request':'Request','profile':'Profile','title':"Together, let's fund projects that change lives.",
      'text':'A platform to receive help, donate or finance a solidarity loan.',
      'help':'Help someone','ask':'Request funding','impact':'Our impact',
      'people':'people helped','find':'Projects to fund','don':'DONATION','loan':'LOAN',
      'contribute':'Contribute','finance':'Fund the loan','new':'New request',
      'amount':'Desired amount','reason':'Reason','description':'Describe your situation',
      'submit':'Submit request','dashboard':'My dashboard','payment':'Payment',
      'pay':'Pay now','method':'Payment method','secure':'Secure payment (demo)'
    },
    'bs': {
      'app':'Solidarnost Finance','home':'Početna','projects':'Projekti',
      'request':'Zahtjev','profile':'Profil','title':'Zajedno finansirajmo projekte koji mijenjaju živote.',
      'text':'Platforma za primanje pomoći, doniranje ili finansiranje solidarnog zajma.',
      'help':'Pomozi nekome','ask':'Zatraži finansiranje','impact':'Naš uticaj',
      'people':'osoba pomognuto','find':'Projekti za finansiranje','don':'DONACIJA','loan':'ZAJAM',
      'contribute':'Doprinesi','finance':'Finansiraj zajam','new':'Novi zahtjev',
      'amount':'Željeni iznos','reason':'Razlog','description':'Opišite svoju situaciju',
      'submit':'Pošalji zahtjev','dashboard':'Moja kontrolna tabla','payment':'Plaćanje',
      'pay':'Plati sada','method':'Način plaćanja','secure':'Sigurno plaćanje (demo)'
    }
  };

  String tr(String k) => t[lang]![k] ?? k;

  @override Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Solidarité Finance',
      theme:ThemeData(useMaterial3:true, colorScheme:ColorScheme.fromSeed(seedColor:const Color(0xff0875d1))),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xff062d52), foregroundColor:Colors.white,
          title:Text(tr('app'),style:const TextStyle(fontWeight:FontWeight.bold)),
          actions:[Padding(padding:const EdgeInsets.only(right:12),child:DropdownButton<String>(
            value:lang, dropdownColor:Colors.white, underline:const SizedBox(),
            items:const [DropdownMenuItem(value:'fr',child:Text('🇫🇷 Français')),DropdownMenuItem(value:'en',child:Text('🇬🇧 English')),DropdownMenuItem(value:'bs',child:Text('🇧🇦 Bosanski'))],
            onChanged:(v)=>setState(()=>lang=v!)
          ))]
        ),
        body: IndexedStack(index:tab, children:[home(),projects(),request(),profile()]),
        bottomNavigationBar:NavigationBar(selectedIndex:tab,onDestinationSelected:(i)=>setState(()=>tab=i),
          destinations:[NavigationDestination(icon:const Icon(Icons.home_outlined),label:tr('home')),
          NavigationDestination(icon:const Icon(Icons.search),label:tr('projects')),
          NavigationDestination(icon:const Icon(Icons.add_circle_outline),label:tr('request')),
          NavigationDestination(icon:const Icon(Icons.person_outline),label:tr('profile'))]),
      )
    );
  }

  Widget home()=>SingleChildScrollView(padding:const EdgeInsets.all(20),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const SizedBox(height:25),Container(padding:const EdgeInsets.all(10),decoration:BoxDecoration(color:Colors.green.shade50,borderRadius:BorderRadius.circular(20)),child:const Text('🔒 Sécurisé • Transparent • Solidaire')),
    const SizedBox(height:20),Text(tr('title'),style:const TextStyle(fontSize:34,fontWeight:FontWeight.bold,color:Color(0xff12304a))),
    const SizedBox(height:15),Text(tr('text'),style:TextStyle(fontSize:17,color:Colors.grey.shade700,height:1.5)),
    const SizedBox(height:25),Wrap(spacing:10,runSpacing:10,children:[
      ElevatedButton(onPressed:()=>setState(()=>tab=1),child:Text(tr('help'))),
      FilledButton(onPressed:()=>setState(()=>tab=2),child:Text(tr('ask')))]),
    const SizedBox(height:35),Card(child:Padding(padding:const EdgeInsets.all(25),child:Column(children:[
      const Text('❤️',style:TextStyle(fontSize:55)),Text(tr('impact'),style:const TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
      const SizedBox(height:8),const Text('12 480',style:TextStyle(fontSize:38,fontWeight:FontWeight.bold,color:Color(0xff0875d1))),
      Text(tr('people'))]))),
  ]));

  Widget projects()=>ListView(padding:const EdgeInsets.all(18),children:[
    Text(tr('find'),style:const TextStyle(fontSize:28,fontWeight:FontWeight.bold)),const SizedBox(height:15),
    project('👩🏾‍👧🏾',tr('don'),'Soutien pour des soins médicaux','1 120 € / 2 000 €',56),
    project('🌾',tr('loan'),'Achat de matériel agricole','960 € / 3 000 €',32),
  ]);

  Widget project(String emoji,String type,String title,String money,int percent)=>Card(margin:const EdgeInsets.only(bottom:18),child:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Container(height:130,alignment:Alignment.center,decoration:BoxDecoration(color:Colors.blue.shade50,borderRadius:BorderRadius.circular(15)),child:Text(emoji,style:const TextStyle(fontSize:65))),
    const SizedBox(height:10),Chip(label:Text(type)),Text(title,style:const TextStyle(fontSize:19,fontWeight:FontWeight.bold)),
    const SizedBox(height:12),LinearProgressIndicator(value:percent/100),const SizedBox(height:7),Text(money),
    SizedBox(width:double.infinity,child:FilledButton(onPressed:()=>showDialog(context:context,builder:(_)=>AlertDialog(title:Text(tr('payment')),content:Text('${tr('method')}\\n📱 Mobile Money\\n💳 Carte bancaire'),actions:[TextButton(onPressed:()=>Navigator.pop(context),child:const Text('OK'))])),child:Text(type==tr('don')?tr('contribute'):tr('finance'))))
  ])));

  Widget request()=>FormPage(tr:tr,onSubmit:()=>showDialog(context:context,builder:(_)=>AlertDialog(title:const Text('✓'),content:Text(tr('submit')),actions:[TextButton(onPressed:()=>Navigator.pop(context),child:const Text('OK'))])));

  Widget profile()=>ListView(padding:const EdgeInsets.all(20),children:[
    Text(tr('dashboard'),style:const TextStyle(fontSize:28,fontWeight:FontWeight.bold)),const SizedBox(height:20),
    Row(children:[Expanded(child:stat('❤️','320 €','Dons reçus')),const SizedBox(width:12),Expanded(child:stat('💰','1 200 €','Prêts en cours'))]),
    const SizedBox(height:20),...['👤 Mon profil','📜 Historique des transactions','🔔 Notifications','🔒 Sécurité et vérification'].map((x)=>Card(child:ListTile(title:Text(x),trailing:const Icon(Icons.chevron_right))))
  ]);

  Widget stat(String icon,String value,String label)=>Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(children:[Text(icon,style:const TextStyle(fontSize:25)),Text(value,style:const TextStyle(fontSize:25,fontWeight:FontWeight.bold)),Text(label,style:const TextStyle(color:Colors.grey))])));
}

class FormPage extends StatelessWidget {
  final String Function(String) tr; final VoidCallback onSubmit;
  const FormPage({super.key,required this.tr,required this.onSubmit});
  @override Widget build(BuildContext context)=>SingleChildScrollView(padding:const EdgeInsets.all(20),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Text(tr('new'),style:const TextStyle(fontSize:28,fontWeight:FontWeight.bold)),const SizedBox(height:18),
    const TextField(decoration:InputDecoration(labelText:'Titre',border:OutlineInputBorder())),const SizedBox(height:12),
    TextField(keyboardType:TextInputType.number,decoration:InputDecoration(labelText:tr('amount'),border:const OutlineInputBorder())),const SizedBox(height:12),
    DropdownButtonFormField(items:const [DropdownMenuItem(value:'soins',child:Text('Soins')),DropdownMenuItem(value:'education',child:Text('Éducation')),DropdownMenuItem(value:'projet',child:Text('Projet professionnel')),],onChanged:(_){},decoration:InputDecoration(labelText:tr('reason'),border:const OutlineInputBorder())),const SizedBox(height:12),
    TextField(maxLines:5,decoration:InputDecoration(labelText:tr('description'),border:const OutlineInputBorder())),const SizedBox(height:20),
    SizedBox(width:double.infinity,child:FilledButton(onPressed:onSubmit,child:Text(tr('submit'))))
  ]));
}
