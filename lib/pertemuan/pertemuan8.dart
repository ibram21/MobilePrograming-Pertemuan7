import 'package:flutter/material.dart';

class AutocompletespinPage extends StatefulWidget {
  const AutocompletespinPage({super.key});

  @override
  State<AutocompletespinPage> createState() => _AutocompleteFormPageState();
}

class _AutocompleteFormPageState extends State<AutocompletespinPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller
  final TextEditingController _universityController = TextEditingController();

  final TextEditingController _majorController = TextEditingController();

  // Selected value
  String? _selectedEducationLevel;
  String? _selectedYear;

  // Data Universitas
  final List<String> _universities = [
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Padjadjaran',
    'Universitas Airlangga',
    'Institut Pertanian Bogor',
    'Universitas Brawijaya',
    'Universitas Diponegoro',
    'Universitas Sebelas Maret',
    'Universitas Negeri Jakarta',
    'Universitas Pamulang',
  ];

  // Data Jurusan
  final List<String> _majors = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Manajemen',
    'Akuntansi',
    'Hukum',
    'Kedokteran',
    'Psikologi',
    'Desain Komunikasi Visual',
    'Hubungan Internasional',
  ];

  // Jenjang Pendidikan
  final List<String> _educationLevels = [
    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',
  ];

  // Tahun Masuk
  final List<String> _years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'Form dengan AutoComplete dan Spinner',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Card(
          elevation: 8,
          shadowColor: Colors.deepPurple.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.edit_note, color: Colors.white),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        'Informasi Mahasiswa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 32, color: Colors.deepPurple),

                  // AUTOCOMPLETE UNIVERSITAS
                  _buildAutocompleteField(
                    label: 'Universitas',
                    controller: _universityController,
                    options: _universities,
                    hint: 'Cari universitas...',
                    icon: Icons.school,
                    onSelected: (value) {
                      setState(() {
                        _universityController.text = value;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  // AUTOCOMPLETE JURUSAN
                  _buildAutocompleteField(
                    label: 'Jurusan',
                    controller: _majorController,
                    options: _majors,
                    hint: 'Cari jurusan...',
                    icon: Icons.book,
                    onSelected: (value) {
                      setState(() {
                        _majorController.text = value;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  // DROPDOWN JENJANG
                  _buildDropdownField(
                    label: 'Jenjang Pendidikan',
                    value: _selectedEducationLevel,
                    items: _educationLevels,
                    hint: 'Pilih jenjang pendidikan',
                    icon: Icons.timeline,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducationLevel = value;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  // DROPDOWN TAHUN
                  _buildDropdownField(
                    label: 'Tahun Masuk',
                    value: _selectedYear,
                    items: _years,
                    hint: 'Pilih tahun masuk',
                    icon: Icons.calendar_today,
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                      });
                    },
                  ),

                  const SizedBox(height: 32),

                  // BUTTON
                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ===========================
  // AUTOCOMPLETE FIELD
  // ===========================

  Widget _buildAutocompleteField({
    required String label,
    required TextEditingController controller,
    required List<String> options,
    required String hint,
    required IconData icon,
    required Function(String) onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.deepPurple),

            const SizedBox(width: 8),

            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),

            const Text(' *', style: TextStyle(color: Colors.red)),
          ],
        ),

        const SizedBox(height: 8),

        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }

            return options.where((option) {
              return option.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              );
            });
          },

          onSelected: onSelected,

          fieldViewBuilder:
              (context, fieldController, focusNode, onFieldSubmitted) {
                fieldController.text = controller.text;

                return TextFormField(
                  controller: fieldController,
                  focusNode: focusNode,

                  decoration: InputDecoration(
                    hintText: hint,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),

                    prefixIcon: const Icon(Icons.search),

                    filled: true,
                    fillColor: Colors.grey[50],
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan pilih $label';
                    }

                    if (!options.contains(value)) {
                      return '$label tidak valid';
                    }

                    return null;
                  },
                );
              },
        ),
      ],
    );
  }

  // ===========================
  // DROPDOWN FIELD
  // ===========================

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required String hint,
    required IconData icon,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.deepPurple),

            const SizedBox(width: 8),

            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),

            const Text(' *', style: TextStyle(color: Colors.red)),
          ],
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: value,

          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),

            filled: true,
            fillColor: Colors.grey[50],
          ),

          hint: Text(hint),

          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),

          onChanged: onChanged,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Silakan pilih $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  // ===========================
  // BUTTON
  // ===========================

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(
        onPressed: _submitForm,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 3,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(Icons.save),

            SizedBox(width: 10),

            Text(
              'Simpan Data',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================
  // SUBMIT FORM
  // ===========================

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,

        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            title: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),

                SizedBox(width: 10),

                Text('Berhasil'),
              ],
            ),

            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text('Data mahasiswa berhasil disimpan.'),

                const SizedBox(height: 16),

                _buildDetailRow(
                  Icons.school,
                  'Universitas',
                  _universityController.text,
                ),

                const SizedBox(height: 8),

                _buildDetailRow(Icons.book, 'Jurusan', _majorController.text),

                const SizedBox(height: 8),

                _buildDetailRow(
                  Icons.timeline,
                  'Jenjang',
                  _selectedEducationLevel ?? '-',
                ),

                const SizedBox(height: 8),

                _buildDetailRow(
                  Icons.calendar_today,
                  'Tahun Masuk',
                  _selectedYear ?? '-',
                ),
              ],
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _resetForm();
                },

                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,

          content: const Row(
            children: [
              Icon(Icons.warning, color: Colors.white),

              SizedBox(width: 10),

              Text('Harap lengkapi semua field'),
            ],
          ),
        ),
      );
    }
  }

  // ===========================
  // DETAIL ROW
  // ===========================

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.deepPurple),

        const SizedBox(width: 8),

        Text('$label : ', style: const TextStyle(fontWeight: FontWeight.w600)),

        Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  // ===========================
  // RESET FORM
  // ===========================

  void _resetForm() {
    setState(() {
      _universityController.clear();
      _majorController.clear();

      _selectedEducationLevel = null;
      _selectedYear = null;
    });
  }

  @override
  void dispose() {
    _universityController.dispose();
    _majorController.dispose();

    super.dispose();
  }
}
