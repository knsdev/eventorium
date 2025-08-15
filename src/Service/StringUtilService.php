<?php

namespace App\Service;

class StringUtilService
{
  public function limitStringLength(string $value, int $maxLength): string
  {
    $strLength = strlen($value);

    if ($strLength > $maxLength) {
      $value = substr($value, 0, $maxLength);
      $value = substr_replace($value, ' ...', -4);
    }

    return $value;
  }
}
