bool boolFromString(dynamic value) =>
    value?.toString().toLowerCase() == 'y' ||
    value?.toString().toLowerCase() == 'true';

DateTime? dateTimeFromString(dynamic value) =>
    value != null ? DateTime.parse(value.toString()) : null;
