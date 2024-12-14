import 'package:flutter/material.dart';
import 'package:interview_task/view/add_asset/addAssetscreen.dart';
import 'package:interview_task/view/add_asset/addAssetController.dart';
import 'package:provider/provider.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  void initState() {
    super.initState();
    context.read<Addassetcontroller>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final proWatch = context.watch<Addassetcontroller>();
    final proRead = context.read<Addassetcontroller>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Addassetview(),
            ),
          );

          proRead.getData();
        },
        child: const Icon(Icons.add),
      ),
      body: proWatch.BxDatas.isEmpty
          ? Center(child: Text('No Assets available'))
          : ListView.builder(
              itemCount: proWatch.BxDatas.length,
              itemBuilder: (context, index) {
                var asset = proRead.BxDatas[index];
                return Card(
                  child: ListTile(
                    title: Text(asset['assetType']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(asset['assetName']),
                        Text(asset['assetDescription']),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Edit') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Addassetview(
                                Description: asset['assetDescription'],
                                Name: asset['assetName'],
                                type: asset['assetType'],
                                isEdit: true,
                                index: index,
                              ),
                            ),
                          );
                        } else if (value == 'Delete') {
                          proRead.deleteData(index: index);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<String>(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
