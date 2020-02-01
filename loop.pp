$filenames = ['file1', 'file2', 'file3', 'file4', 'file5']

$filenames.each |String $file| {
  file {"/tmp/${file}":
    ensure => present,
  }
}
