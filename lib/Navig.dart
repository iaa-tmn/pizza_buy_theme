import 'package:flutter/material.dart';
import 'package:pizza_buy/main.dart';

Widget navDraw(context)=> Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Container(height: 500,)
        ),
      ListTile(
        leading: const Icon(Icons.home),
        title: Text("Главная",style: Theme.of(context).textTheme.bodyText1),
        onTap: (){
          Navigator.pushNamed(context, '/',);
        },
      ),
      ListTile(
        leading: const Icon(Icons.contact_support),
        title: Text("Контакты",style: Theme.of(context).textTheme.bodyText1,),
        onTap: (){
          Navigator.pushNamed(context, '/contact');
        },
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider(color: Colors.black12, thickness: 2,),
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: Text("Настройки",style: Theme.of(context).textTheme.bodyText1),
        onTap: (){
          Navigator.pushNamed(context, '/settings');
        },
      ),
      SwitchListTile(title:Text("Темная тема",style: Theme.of(context).textTheme.bodyText1),value: false, onChanged: (val){})
    ],
  ),
);