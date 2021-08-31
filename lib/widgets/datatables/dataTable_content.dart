import 'package:flutter/material.dart';


class DataTableWidget extends StatefulWidget {
      @override
      _DataTableWidgetState createState() => _DataTableWidgetState();
    }
    
    class _DataTableWidgetState extends State<DataTableWidget> {
    
      /// True since we want our list to be in ascending order initially
      bool sort = true;
    
      List<int> num = [1, 2, 3, 4, 5, 6];
      List<String> listItems = [
        'Grocries',
        'Electronics',
        'Clothes',
        'Office Supplies',
        'Veggies',
        'Dairy'
      ];
    
      /// Method called when the header of 1st column is clicked
      onSort(int columnIndex, bool ascending) {
        if (columnIndex == 0) {
          if (ascending) {
            /// Sort the list in ascending order
            num.sort((a, b) => a.compareTo(b));
            listItems = listItems.reversed.toList();
          } else {
            /// Sort the list in descending order
            num.sort((b, a) => a.compareTo(b));
            listItems = listItems.reversed.toList();
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
              'Content',
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
                  scrollDirection: Axis.horizontal,
                  
                  child: DataTable(
                    sortColumnIndex: 0,
                    sortAscending: sort,
                    columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
                    dataRowHeight: 80,
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
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Date Added')),
                      DataColumn(label: Text('Genre')),
                      DataColumn(label: Text('Rating')),
                      DataColumn(label: Text('Duration')),
                      DataColumn(label: Text('Release Year')),
                      DataColumn(label: Text('Delete'))
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('num[0]')),
                          DataCell(Text(listItems[0])),
                          DataCell(Text('data')),
                          DataCell(Text('data2')),
                          DataCell(Text('data')),
                          DataCell(Text('data4')),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Delete'),
                            onPressed: (){},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('num[1]')),
                          DataCell(Text(listItems[1])),
                          DataCell(Text('data')),
                          DataCell(Text('data1')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data3')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Delete'),
                            onPressed: (){},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('num[2]')),
                          DataCell(Text(listItems[2])),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Delete'),
                            onPressed: (){},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('num[3]')),
                          DataCell(Text(listItems[3])),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Delete'),
                            onPressed: (){},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          )
                        ],
                      ),DataRow(
                        cells: [
                          DataCell(Text('num[4]')),
                          DataCell(Text(listItems[4])),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Delete'),
                            onPressed: (){},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          )
                        ],
                      ),DataRow(
                        cells: [
                          DataCell(Text('num[5]')),
                          DataCell(Text(listItems[5])),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(Text('data')),
                          DataCell(
                            ElevatedButton(
                            child: Text('Delete'),
                            onPressed: (){},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                            ),
                          )
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