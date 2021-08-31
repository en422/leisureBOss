import 'package:flutter/material.dart';


class DataTableWidget extends StatefulWidget {
      @override
      _DataTableWidgetState createState() => _DataTableWidgetState();
    }
    
    class _DataTableWidgetState extends State<DataTableWidget> {
    
      /// True since we want our list to be in ascending order initially
      bool sort = true;
      bool stat = true;
    
      List<int> num = [1, 2, 3, 4, 5, 6];
      List<String> user = [
        'User001',
        'User002',
        'User003',
        'User004',
        'User005',
        'User006'
      ];
    
      /// Method called when the header of 1st column is clicked
      onSort(int columnIndex, bool ascending) {
        if (columnIndex == 0) {
          if (ascending) {
            /// Sort the list in ascending order
            num.sort((a, b) => a.compareTo(b));
            user = user.reversed.toList();
          } else {
            /// Sort the list in descending order
            num.sort((b, a) => a.compareTo(b));
            user = user.reversed.toList();
          }
        }
      }
    
      @override
      Widget build(BuildContext context) {
        var code;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Users',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.code),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => codeScreen(code: code.dataTableWidgetCode),
                  ),
                ),
              )
            ],
          ),
          body: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              /// To make the datatable take all the available space
              Expanded(
                /// DataTable wrapped inside Scroll View for smaller devices
                /// or landscape view
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    sortColumnIndex: 0,
                    sortAscending: sort,
                    columns: [
                      DataColumn(
                          label: Text('S.No'),
                          numeric: true,
    
                          /// Triggered when you click the column header
                          onSort: (columnIndex, ascending) {
                            setState(() {
                              /// To control the value of "sortAscending" for the
                              /// DataTable
                              sort = !sort;
                            });
    
                            /// Call the onSort method with logic to sort both
                            /// the columns together
                            onSort(columnIndex, ascending);
                          }),
                      DataColumn(label: Text('Username')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Ban'))
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text(num[0].toString())),
                          DataCell(Text(user[0])),
                          DataCell(Text('data')),
                          DataCell( 
                            ElevatedButton(
                            child: Text('Ban'),
                            onPressed: (){stat = true;},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text(num[1].toString())),
                          DataCell(Text(user[1])),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Ban'),
                            onPressed: (){stat = true;},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text(num[2].toString())),
                          DataCell(Text(user[2])),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Ban'),
                            onPressed: (){stat = true;},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text(num[3].toString())),
                          DataCell(Text(user[3])),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Ban'),
                            onPressed: (){stat = true;},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          ),
                        ],
                      ),DataRow(
                        cells: [
                          DataCell(Text(num[4].toString())),
                          DataCell(Text(user[4])),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Ban'),
                            onPressed: (){stat = true;},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          ),
                        ],
                      ),DataRow(
                        cells: [
                          DataCell(Text(num[5].toString())),
                          DataCell(Text(user[5])),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Ban'),
                            onPressed: (){stat = true;},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),        
              ),
            ],
          ),
        );
      }

  codeScreen({code}) {}
    }