CNWTEPRGs��
s ��Ϫ��ͻ��s s s s s            <                                                                                                s��us �ú���λ��s s s s s            X                                                                                                                                  s�Jr�s �����Э��s s s s s          �pއ�                                            IbR �MУ�{_b   ����mian       l  Hb�����������������������\�&f�&g�&]�&^�&_�&`�&��ab    k   �   �  R  �  {  N  "  �  �  �  h  7	  �	  �
  
  �  t  �    F  �  �    c  �  g                           �"
2   2   �  �                                                         �   	                      �����4  �!"
8  �  �  �              ��                                                         �        �                         �༭��_ret   ""
      �  �       ��                                                         ���                     *             d                           �                         ��ť3  @#"
8  �  �   @                                                                                  ͣ  ֹ�                         ��ť2  �#"
x  �  �   @                                                                                  �� ���   	                      �����3  0%"
  �     �              �                                                         �    
   �����趨���                         �༭��_shd  �%"
        �       �                                                         ���                      *             d                  С����
����        �   
                      ��ǩ4  �&"
(   (   P          �                                                             ��� ��� ���        �       ��� ��� ���                       ˢ�¼��ms��        �                         �༭��_ˢ�¼��  �'"
�   (   @          �                                                         ���                      *             d                  500        �   
                      ��ǩ3  �("
(   h   P          �                                                             ��� ��� ���        �       ��� ��� ���                       �ύ�߳�����        �                         �༭��_�ύ�߳���  P*"
�   h   @          �                                                         ���                      *             d                  3        �   
                      ��ǩ2  p+"
(   H   P          �                                                             ��� ��� ���        �       ��� ��� ���                       ˢ���߳�����        �                         �༭��_ˢ���߳���  P,"
�   H   @          �                                                         ���                      *             d                  1        �   	                      �����2  p-"
   �     �              ������                                                         �       ���ã��                         ѡ���1   ."
�     h          ��                                                                            �               ���ô���        u                         �༭��_����api  �."
8      h         ��                                               �   
                      ��ǩ1   "
                 ��                                                             ��� ��� ���        �       ��� ��� ���                       API��        �   	                      �����1   "
   �  (  @              ������                                                         �       ����IP:?                         cd             cd                     K                         ��¼ȫ��             ��¼ȫ��                     <                                      -                     C                         ��¼             ��¼                     C                         �˳�             �˳�                     <                                      -                     K                         ��Ϊ����             ��Ϊ����                     �                         �ϷŶ���1  �P  �                                                                                   �                        �����б���1  @ �      �  �                                                                   ��� ���                                                              ����                �    ����    2     ����    X   �˺�  ����    M   ����  ����    X   Wxid  ����    2   Gps  ����    c   Usid  ����    �   ���ƺ�  ����    �   Token  ����    2   ProxyIp  ����    ,  Status            �� �/#1��    �� �� ��  RSA  �� var window = this;
var navigator = {};
(function (global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports) :
	typeof define === 'function' && define.amd ? define(['exports'], factory) :
	(factory((global.JSEncrypt = {})));
}(this, (function (exports) { 'use strict';

var BI_RM = "0123456789abcdefghijklmnopqrstuvwxyz";
function int2char(n) {
    return BI_RM.charAt(n);
}
//#region BIT_OPERATIONS
// (public) this & a
function op_and(x, y) {
    return x & y;
}
// (public) this | a
function op_or(x, y) {
    return x | y;
}
// (public) this ^ a
function op_xor(x, y) {
    return x ^ y;
}
// (public) this & ~a
function op_andnot(x, y) {
    return x & ~y;
}
// return index of lowest 1-bit in x, x < 2^31
function lbit(x) {
    if (x == 0) {
        return -1;
    }
    var r = 0;
    if ((x & 0xffff) == 0) {
        x >>= 16;
        r += 16;
    }
    if ((x & 0xff) == 0) {
        x >>= 8;
        r += 8;
    }
    if ((x & 0xf) == 0) {
        x >>= 4;
        r += 4;
    }
    if ((x & 3) == 0) {
        x >>= 2;
        r += 2;
    }
    if ((x & 1) == 0) {
        ++r;
    }
    return r;
}
// return number of 1 bits in x
function cbit(x) {
    var r = 0;
    while (x != 0) {
        x &= x - 1;
        ++r;
    }
    return r;
}
//#endregion BIT_OPERATIONS

var b64map = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
var b64pad = "=";
function hex2b64(h) {
    var i;
    var c;
    var ret = "";
    for (i = 0; i + 3 <= h.length; i += 3) {
        c = parseInt(h.substring(i, i + 3), 16);
        ret += b64map.charAt(c >> 6) + b64map.charAt(c & 63);
    }
    if (i + 1 == h.length) {
        c = parseInt(h.substring(i, i + 1), 16);
        ret += b64map.charAt(c << 2);
    }
    else if (i + 2 == h.length) {
        c = parseInt(h.substring(i, i + 2), 16);
        ret += b64map.charAt(c >> 2) + b64map.charAt((c & 3) << 4);
    }
    while ((ret.length & 3) > 0) {
        ret += b64pad;
    }
    return ret;
}
// convert a base64 string to hex
function b64tohex(s) {
    var ret = "";
    var i;
    var k = 0; // b64 state, 0-3
    var slop = 0;
    for (i = 0; i < s.length; ++i) {
        if (s.charAt(i) == b64pad) {
            break;
        }
        var v = b64map.indexOf(s.charAt(i));
        if (v < 0) {
            continue;
        }
        if (k == 0) {
            ret += int2char(v >> 2);
            slop = v & 3;
            k = 1;
        }
        else if (k == 1) {
            ret += int2char((slop << 2) | (v >> 4));
            slop = v & 0xf;
            k = 2;
        }
        else if (k == 2) {
            ret += int2char(slop);
            ret += int2char(v >> 2);
            slop = v & 3;
            k = 3;
        }
        else {
            ret += int2char((slop << 2) | (v >> 4));
            ret += int2char(v & 0xf);
            k = 0;
        }
    }
    if (k == 1) {
        ret += int2char(slop << 2);
    }
    return ret;
}

/*! *****************************************************************************
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at http://www.apache.org/licenses/LICENSE-2.0

THIS CODE IS PROVIDED ON AN *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
MERCHANTABLITY OR NON-INFRINGEMENT.

See the Apache Version 2.0 License for specific language governing permissions
and limitations under the License.
***************************************************************************** */
/* global Reflect, Promise */

var extendStatics = function(d, b) {
    extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return extendStatics(d, b);
};

function __extends(d, b) {
    extendStatics(d, b);
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
}

// Hex JavaScript decoder
// Copyright (c) 2008-2013 Lapo Luchini <lapo@lapo.it>
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
/*jshint browser: true, strict: true, immed: true, latedef: true, undef: true, regexdash: false */
var decoder;
var Hex = {
    decode: function (a) {
        var i;
        if (decoder === undefined) {
            var hex = "0123456789ABCDEF";
            var ignore = " \f\n\r\t\u00A0\u2028\u2029";
            decoder = {};
            for (i = 0; i < 16; ++i) {
                decoder[hex.charAt(i)] = i;
            }
            hex = hex.toLowerCase();
            for (i = 10; i < 16; ++i) {
                decoder[hex.charAt(i)] = i;
            }
            for (i = 0; i < ignore.length; ++i) {
                decoder[ignore.charAt(i)] = -1;
            }
        }
        var out = [];
        var bits = 0;
        var char_count = 0;
        for (i = 0; i < a.length; ++i) {
            var c = a.charAt(i);
            if (c == "=") {
                break;
            }
            c = decoder[c];
            if (c == -1) {
                continue;
            }
            if (c === undefined) {
                throw new Error("Illegal character at offset " + i);
            }
            bits |= c;
            if (++char_count >= 2) {
                out[out.length] = bits;
                bits = 0;
                char_count = 0;
            }
            else {
                bits <<= 4;
            }
        }
        if (char_count) {
            throw new Error("Hex encoding incomplete: 4 bits missing");
        }
        return out;
    }
};

// Base64 JavaScript decoder
// Copyright (c) 2008-2013 Lapo Luchini <lapo@lapo.it>
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
/*jshint browser: true, strict: true, immed: true, latedef: true, undef: true, regexdash: false */
var decoder$1;
var Base64 = {
    decode: function (a) {
        var i;
        if (decoder$1 === undefined) {
            var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            var ignore = "= \f\n\r\t\u00A0\u2028\u2029";
            decoder$1 = Object.create(null);
            for (i = 0; i < 64; ++i) {
                decoder$1[b64.charAt(i)] = i;
            }
            for (i = 0; i < ignore.length; ++i) {
                decoder$1[ignore.charAt(i)] = -1;
            }
        }
        var out = [];
        var bits = 0;
        var char_count = 0;
        for (i = 0; i < a.length; ++i) {
            var c = a.charAt(i);
            if (c == "=") {
                break;
            }
            c = decoder$1[c];
            if (c == -1) {
                continue;
            }
            if (c === undefined) {
                throw new Error("Illegal character at offset " + i);
            }
            bits |= c;
            if (++char_count >= 4) {
                out[out.length] = (bits >> 16);
                out[out.length] = (bits >> 8) & 0xFF;
                out[out.length] = bits & 0xFF;
                bits = 0;
                char_count = 0;
            }
            else {
                bits <<= 6;
            }
        }
        switch (char_count) {
            case 1:
                throw new Error("Base64 encoding incomplete: at least 2 bits missing");
            case 2:
                out[out.length] = (bits >> 10);
                break;
            case 3:
                out[out.length] = (bits >> 16);
                out[out.length] = (bits >> 8) & 0xFF;
                break;
        }
        return out;
    },
    re: /-----BEGIN [^-]+-----([A-Za-z0-9+\/=\s]+)-----END [^-]+-----|begin-base64[^\n]+\n([A-Za-z0-9+\/=\s]+)====/,
    unarmor: function (a) {
        var m = Base64.re.exec(a);
        if (m) {
            if (m[1]) {
                a = m[1];
            }
            else if (m[2]) {
                a = m[2];
            }
            else {
                throw new Error("RegExp out of sync");
            }
        }
        return Base64.decode(a);
    }
};

// Big integer base-10 printing library
// Copyright (c) 2014 Lapo Luchini <lapo@lapo.it>
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
/*jshint browser: true, strict: true, immed: true, latedef: true, undef: true, regexdash: false */
var max = 10000000000000; // biggest integer that can still fit 2^53 when multiplied by 256
var Int10 = /** @class */ (function () {
    function Int10(value) {
        this.buf = [+value || 0];
    }
    Int10.prototype.mulAdd = function (m, c) {
        // assert(m <= 256)
        var b = this.buf;
        var l = b.length;
        var i;
        var t;
        for (i = 0; i < l; ++i) {
            t = b[i] * m + c;
            if (t < max) {
                c = 0;
            }
            else {
                c = 0 | (t / max);
                t -= c * max;
            }
            b[i] = t;
        }
        if (c > 0) {
            b[i] = c;
        }
    };
    Int10.prototype.sub = function (c) {
        // assert(m <= 256)
        var b = this.buf;
        var l = b.length;
        var i;
        var t;
        for (i = 0; i < l; ++i) {
            t = b[i] - c;
            if (t < 0) {
                t += max;
                c = 1;
            }
            else {
                c = 0;
            }
            b[i] = t;
        }
        while (b[b.length - 1] === 0) {
            b.pop();
        }
    };
    Int10.prototype.toString = function (base) {
        if ((base || 10) != 10) {
            throw new Error("only base 10 is supported");
        }
        var b = this.buf;
        var s = b[b.length - 1].toString();
        for (var i = b.length - 2; i >= 0; --i) {
            s += (max + b[i]).toString().substring(1);
        }
        return s;
    };
    Int10.prototype.valueOf = function () {
        var b = this.buf;
        var v = 0;
        for (var i = b.length - 1; i >= 0; --i) {
            v = v * max + b[i];
        }
        return v;
    };
    Int10.prototype.simplify = function () {
        var b = this.buf;
        return (b.length == 1) ? b[0] : this;
    };
    return Int10;
}());

// ASN.1 JavaScript decoder
var ellipsis = "\u2026";
var reTimeS = /^(\d\d)(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])([01]\d|2[0-3])(?:([0-5]\d)(?:([0-5]\d)(?:[.,](\d{1,3}))?)?)?(Z|[-+](?:[0]\d|1[0-2])([0-5]\d)?)?$/;
var reTimeL = /^(\d\d\d\d)(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])([01]\d|2[0-3])(?:([0-5]\d)(?:([0-5]\d)(?:[.,](\d{1,3}))?)?)?(Z|[-+](?:[0]\d|1[0-2])([0-5]\d)?)?$/;
function stringCut(str, len) {
    if (str.length > len) {
        str = str.substring(0, len) + ellipsis;
    }
    return str;
}
var Stream = /** @class */ (function () {
    function Stream(enc, pos) {
        this.hexDigits = "0123456789ABCDEF";
        if (enc instanceof Stream) {
            this.enc = enc.enc;
            this.pos = enc.pos;
        }
        else {
            // enc should be an array or a binary string
            this.enc = enc;
            this.pos = pos;
        }
    }
    Stream.prototype.get = function (pos) {
        if (pos === undefined) {
            pos = this.pos++;
        }
        if (pos >= this.enc.length) {
            throw new Error("Requesting byte offset " + pos + " on a stream of length " + this.enc.length);
        }
        return ("string" === typeof this.enc) ? this.enc.charCodeAt(pos) : this.enc[pos];
    };
    Stream.prototype.hexByte = function (b) {
        return this.hexDigits.charAt((b >> 4) & 0xF) + this.hexDigits.charAt(b & 0xF);
    };
    Stream.prototype.hexDump = function (start, end, raw) {
        var s = "";
        for (var i = start; i < end; ++i) {
            s += this.hexByte(this.get(i));
            if (raw !== true) {
                switch (i & 0xF) {
                    case 0x7:
                        s += "  ";
                        break;
                    case 0xF:
                        s += "\n";
                        break;
                    default:
                        s += " ";
                }
            }
        }
        return s;
    };
    Stream.prototype.isASCII = function (start, end) {
        for (var i = start; i < end; ++i) {
            var c = this.get(i);
            if (c < 32 || c > 176) {
                return false;
            }
        }
        return true;
    };
    Stream.prototype.parseStringISO = function (start, end) {
        var s = "";
        for (var i = start; i < end; ++i) {
            s += String.fromCharCode(this.get(i));
        }
        return s;
    };
    Stream.prototype.parseStringUTF = function (start, end) {
        var s = "";
        for (var i = start; i < end;) {
            var c = this.get(i++);
            if (c < 128) {
                s += String.fromCharCode(c);
            }
            else if ((c > 191) && (c < 224)) {
                s += String.fromCharCode(((c & 0x1F) << 6) | (this.get(i++) & 0x3F));
            }
            else {
                s += String.fromCharCode(((c & 0x0F) << 12) | ((this.get(i++) & 0x3F) << 6) | (this.get(i++) & 0x3F));
            }
        }
        return s;
    };
    Stream.prototype.parseStringBMP = function (start, end) {
        var str = "";
        var hi;
        var lo;
        for (var i = start; i < end;) {
            hi = this.get(i++);
            lo = this.get(i++);
            str += String.fromCharCode((hi << 8) | lo);
        }
        return str;
    };
    Stream.prototype.parseTime = function (start, end, shortYear) {
        var s = this.parseStringISO(start, end);
        var m = (shortYear ? reTimeS : reTimeL).exec(s);
        if (!m) {
            return "Unrecognized time: " + s;
        }
        if (shortYear) {
            // to avoid querying the timer, use the fixed range [1970, 2069]
            // it will conform with ITU X.400 [-10, +40] sliding window until 2030
            m[1] = +m[1];
            m[1] += (+m[1] < 70) ? 2000 : 1900;
        }
        s = m[1] + "-" + m[2] + "-" + m[3] + " " + m[4];
        if (m[5]) {
            s += ":" + m[5];
            if (m[6]) {
                s += ":" + m[6];
                if (m[7]) {
                    s += "." + m[7];
                }
            }
        }
        if (m[8]) {
            s += " UTC";
            if (m[8] != "Z") {
                s += m[8];
                if (m[9]) {
                    s += ":" + m[9];
                }
            }
        }
        return s;
    };
    Stream.prototype.parseInteger = function (start, end) {
        var v = this.get(start);
        var neg = (v > 127);
        var pad = neg ? 255 : 0;
        var len;
        var s = "";
        // skip unuseful bits (not allowed in DER)
        while (v == pad && ++start < end) {
            v = this.get(start);
        }
        len = end - start;
        if (len === 0) {
            return neg ? -1 : 0;
        }
        // show bit length of huge integers
        if (len > 4) {
            s = v;
            len <<= 3;
            while (((+s ^ pad) & 0x80) == 0) {
                s = +s << 1;
                --len;
            }
            s = "(" + len + " bit)\n";
        }
        // decode the integer
        if (neg) {
            v = v - 256;
        }
        var n = new Int10(v);
        for (var i = start + 1; i < end; ++i) {
            n.mulAdd(256, this.get(i));
        }
        return s + n.toString();
    };
    Stream.prototype.parseBitString = function (start, end, maxLength) {
        var unusedBit = this.get(start);
        var lenBit = ((end - start - 1) << 3) - unusedBit;
        var intro = "(" + lenBit + " bit)\n";
        var s = "";
        for (var i = start + 1; i < end; ++i) {
            var b = this.get(i);
            var skip = (i == end - 1) ? unusedBit : 0;
            for (var j = 7; j >= skip; --j) {
                s += (b >> j) & 1 ? "1" : "0";
            }
            if (s.length > maxLength) {
                return intro + stringCut(s, maxLength);
            }
        }
        return intro + s;
    };
    Stream.prototype.parseOctetString = function (start, end, maxLength) {
        if (this.isASCII(start, end)) {
            return stringCut(this.parseStringISO(start, end), maxLength);
        }
        var len = end - start;
        var s = "(" + len + " byte)\n";
        maxLength /= 2; // we work in bytes
        if (len > maxLength) {
            end = start + maxLength;
        }
        for (var i = start; i < end; ++i) {
            s += this.hexByte(this.get(i));
        }
        if (len > maxLength) {
            s += ellipsis;
        }
        return s;
    };
    Stream.prototype.parseOID = function (start, end, maxLength) {
        var s = "";
        var n = new Int10();
        var bits = 0;
        for (var i = start; i < end; ++i) {
            var v = this.get(i);
            n.mulAdd(128, v & 0x7F);
            bits += 7;
            if (!(v & 0x80)) { // finished
                if (s === "") {
                    n = n.simplify();
                    if (n instanceof Int10) {
                        n.sub(80);
                        s = "2." + n.toString();
                    }
                    else {
                        var m = n < 80 ? n < 40 ? 0 : 1 : 2;
                        s = m + "." + (n - m * 40);
                    }
                }
                else {
                    s += "." + n.toString();
                }
                if (s.length > maxLength) {
                    return stringCut(s, maxLength);
                }
                n = new Int10();
                bits = 0;
            }
        }
        if (bits > 0) {
            s += ".incomplete";
        }
        return s;
    };
    return Stream;
}());
var ASN1 = /** @class */ (function () {
    function ASN1(stream, header, length, tag, sub) {
        if (!(tag instanceof ASN1Tag)) {
            throw new Error("Invalid tag value.");
        }
        this.stream = stream;
        this.header = header;
        this.length = length;
        this.tag = tag;
        this.sub = sub;
    }
    ASN1.prototype.typeName = function () {
        switch (this.tag.tagClass) {
            case 0: // universal
                switch (this.tag.tagNumber) {
                    case 0x00:
                        return "EOC";
                    case 0x01:
                        return "BOOLEAN";
                    case 0x02:
                        return "INTEGER";
                    case 0x03:
                        return "BIT_STRING";
                    case 0x04:
                        return "OCTET_STRING";
                    case 0x05:
                        return "NULL";
                    case 0x06:
                        return "OBJECT_IDENTIFIER";
                    case 0x07:
                        return "ObjectDescriptor";
                    case 0x08:
                        return "EXTERNAL";
                    case 0x09:
                        return "REAL";
                    case 0x0A:
                        return "ENUMERATED";
                    case 0x0B:
                        return "EMBEDDED_PDV";
                    case 0x0C:
                        return "UTF8String";
                    case 0x10:
                        return "SEQUENCE";
                    case 0x11:
                        return "SET";
                    case 0x12:
                        return "NumericString";
                    case 0x13:
                        return "PrintableString"; // ASCII subset
                    case 0x14:
                        return "TeletexString"; // aka T61String
                    case 0x15:
                        return "VideotexString";
                    case 0x16:
                        return "IA5String"; // ASCII
                    case 0x17:
                        return "UTCTime";
                    case 0x18:
                        return "GeneralizedTime";
                    case 0x19:
                        return "GraphicString";
                    case 0x1A:
                        return "VisibleString"; // ASCII subset
                    case 0x1B:
                        return "GeneralString";
                    case 0x1C:
                        return "UniversalString";
                    case 0x1E:
                        return "BMPString";
                }
                return "Universal_" + this.tag.tagNumber.toString();
            case 1:
                return "Application_" + this.tag.tagNumber.toString();
            case 2:
                return "[" + this.tag.tagNumber.toString() + "]"; // Context
            case 3:
                return "Private_" + this.tag.tagNumber.toString();
        }
    };
    ASN1.prototype.content = function (maxLength) {
        if (this.tag === undefined) {
            return null;
        }
        if (maxLength === undefined) {
            maxLength = Infinity;
        }
        var content = this.posContent();
        var len = Math.abs(this.length);
        if (!this.tag.isUniversal()) {
            if (this.sub !== null) {
                return "(" + this.sub.length + " elem)";
            }
            return this.stream.parseOctetString(content, content + len, maxLength);
        }
        switch (this.tag.tagNumber) {
            case 0x01: // BOOLEAN
                return (this.stream.get(content) === 0) ? "false" : "true";
            case 0x02: // INTEGER
                return this.stream.parseInteger(content, content + len);
            case 0x03: // BIT_STRING
                return this.sub ? "(" + this.sub.length + " elem)" :
                    this.stream.parseBitString(content, content + len, maxLength);
            case 0x04: // OCTET_STRING
                return this.sub ? "(" + this.sub.length + " elem)" :
                    this.stream.parseOctetString(content, content + len, maxLength);
            // case 0x05: // NULL
            case 0x06: // OBJECT_IDENTIFIER
                return this.stream.parseOID(content, content + len, maxLength);
            // case 0x07: // ObjectDescriptor
            // case 0x08: // EXTERNAL
            // case 0x09: // REAL
            // case 0x0A: // ENUMERATED
            // case 0x0B: // EMBEDDED_PDV
            case 0x10: // SEQUENCE
            case 0x11: // SET
                if (this.sub !== null) {
                    return "(" + this.sub.length + " elem)";
                }
                else {
                    return "(no elem)";
                }
            case 0x0C: // UTF8String
                return stringCut(this.stream.parseStringUTF(content, content + len), maxLength);
            case 0x12: // NumericString
            case 0x13: // PrintableString
            case 0x14: // TeletexString
            case 0x15: // VideotexString
            case 0x16: // IA5String
            // case 0x19: // GraphicString
            case 0x1A: // VisibleString
                // case 0x1B: // GeneralString
                // case 0x1C: // UniversalString
                return stringCut(this.stream.parseStringISO(content, content + len), maxLength);
            case 0x1E: // BMPString
                return stringCut(this.stream.parseStringBMP(content, content + len), maxLength);
            case 0x17: // UTCTime
            case 0x18: // GeneralizedTime
                return this.stream.parseTime(content, content + len, (this.tag.tagNumber == 0x17));
        }
        return null;
    };
    ASN1.prototype.toString = function () {
        return this.typeName() + "@" + this.stream.pos + "[header:" + this.header + ",length:" + this.length + ",sub:" + ((this.sub === null) ? "null" : this.sub.length) + "]";
    };
    ASN1.prototype.toPrettyString = function (indent) {
        if (indent === undefined) {
            indent = "";
        }
        var s = indent + this.typeName() + " @" + this.stream.pos;
        if (this.length >= 0) {
            s += "+";
        }
        s += this.length;
        if (this.tag.tagConstructed) {
            s += " (constructed)";
        }
        else if ((this.tag.isUniversal() && ((this.tag.tagNumber == 0x03) || (this.tag.tagNumber == 0x04))) && (this.sub !== null)) {
            s += " (encapsulates)";
        }
        s += "\n";
        if (this.sub !== null) {
            indent += "  ";
            for (var i = 0, max = this.sub.length; i < max; ++i) {
                s += this.sub[i].toPrettyString(indent);
            }
        }
        return s;
    };
    ASN1.prototype.posStart = function () {
        return this.stream.pos;
    };
    ASN1.prototype.posContent = function () {
        return this.stream.pos + this.header;
    };
    ASN1.prototype.posEnd = function () {
        return this.stream.pos + this.header + Math.abs(this.length);
    };
    ASN1.prototype.toHexString = function () {
        return this.stream.hexDump(this.posStart(), this.posEnd(), true);
    };
    ASN1.decodeLength = function (stream) {
        var buf = stream.get();
        var len = buf & 0x7F;
        if (len == buf) {
            return len;
        }
        // no reason to use Int10, as it would be a huge buffer anyways
        if (len > 6) {
            throw new Error("Length over 48 bits not supported at position " + (stream.pos - 1));
        }
        if (len === 0) {
            return null;
        } // undefined
        buf = 0;
        for (var i = 0; i < len; ++i) {
            buf = (buf * 256) + stream.get();
        }
        return buf;
    };
    /**
     * Retrieve the hexadecimal value (as a string) of the current ASN.1 element
     * @returns {string}
     * @public
     */
    ASN1.prototype.getHexStringValue = function () {
        var hexString = this.toHexString();
        var offset = this.header * 2;
        var length = this.length * 2;
        return hexString.substr(offset, length);
    };
    ASN1.decode = function (str) {
        var stream;
        if (!(str instanceof Stream)) {
            stream = new Stream(str, 0);
        }
        else {
            stream = str;
        }
        var streamStart = new Stream(stream);
        var tag = new ASN1Tag(stream);
        var len = ASN1.decodeLength(stream);
        var start = stream.pos;
        var header = start - streamStart.pos;
        var sub = null;
        var getSub = function () {
            var ret = [];
            if (len !== null) {
                // definite length
                var end = start + len;
                while (stream.pos < end) {
                    ret[ret.length] = ASN1.decode(stream);
                }
                if (stream.pos != end) {
                    throw new Error("Content size is not correct for container starting at offset " + start);
                }
            }
            else {
                // undefined length
                try {
                    for (;;) {
                        var s = ASN1.decode(stream);
                        if (s.tag.isEOC()) {
                            break;
                        }
                        ret[ret.length] = s;
                    }
                    len = start - stream.pos; // undefined lengths are represented as negative values
                }
                catch (e) {
                    throw new Error("Exception while decoding undefined length content: " + e);
                }
            }
            return ret;
        };
        if (tag.tagConstructed) {
            // must have valid content
            sub = getSub();
        }
        else if (tag.isUniversal() && ((tag.tagNumber == 0x03) || (tag.tagNumber == 0x04))) {
            // sometimes BitString and OctetString are used to encapsulate ASN.1
            try {
                if (tag.tagNumber == 0x03) {
                    if (stream.get() != 0) {
                        throw new Error("BIT STRINGs with unused bits cannot encapsulate.");
                    }
                }
                sub = getSub();
                for (var i = 0; i < sub.length; ++i) {
                    if (sub[i].tag.isEOC()) {
                        throw new Error("EOC is not supposed to be actual content.");
                    }
                }
            }
            catch (e) {
                // but silently ignore when they don't
                sub = null;
            }
        }
        if (sub === null) {
            if (len === null) {
                throw new Error("We can't skip over an invalid tag with undefined length at offset " + start);
            }
            stream.pos = start + Math.abs(len);
        }
        return new ASN1(streamStart, header, len, tag, sub);
    };
    return ASN1;
}());
var ASN1Tag = /** @class */ (function () {
    function ASN1Tag(stream) {
        var buf = stream.get();
        this.tagClass = buf >> 6;
        this.tagConstructed = ((buf & 0x20) !== 0);
        this.tagNumber = buf & 0x1F;
        if (this.tagNumber == 0x1F) { // long tag
            var n = new Int10();
            do {
                buf = stream.get();
                n.mulAdd(128, buf & 0x7F);
            } while (buf & 0x80);
            this.tagNumber = n.simplify();
        }
    }
    ASN1Tag.prototype.isUniversal = function () {
        return this.tagClass === 0x00;
    };
    ASN1Tag.prototype.isEOC = function () {
        return this.tagClass === 0x00 && this.tagNumber === 0x00;
    };
    return ASN1Tag;
}());

// Copyright (c) 2005  Tom Wu
// Bits per digit
var dbits;
// JavaScript engine analysis
var canary = 0xdeadbeefcafe;
var j_lm = ((canary & 0xffffff) == 0xefcafe);
//#region
var lowprimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997];
var lplim = (1 << 26) / lowprimes[lowprimes.length - 1];
//#endregion
// (public) Constructor
var BigInteger = /** @class */ (function () {
    function BigInteger(a, b, c) {
        if (a != null) {
            if ("number" == typeof a) {
                this.fromNumber(a, b, c);
            }
            else if (b == null && "string" != typeof a) {
                this.fromString(a, 256);
            }
            else {
                this.fromString(a, b);
            }
        }
    }
    //#region PUBLIC
    // BigInteger.prototype.toString = bnToString;
    // (public) return string representation in given radix
    BigInteger.prototype.toString = function (b) {
        if (this.s < 0) {
            return "-" + this.negate().toString(b);
        }
        var k;
        if (b == 16) {
            k = 4;
        }
        else if (b == 8) {
            k = 3;
        }
        else if (b == 2) {
            k = 1;
        }
        else if (b == 32) {
            k = 5;
        }
        else if (b == 4) {
            k = 2;
        }
        else {
            return this.toRadix(b);
        }
        var km = (1 << k) - 1;
        var d;
        var m = false;
        var r = "";
        var i = this.t;
        var p = this.DB - (i * this.DB) % k;
        if (i-- > 0) {
            if (p < this.DB && (d = this[i] >> p) > 0) {
                m = true;
                r = int2char(d);
            }
            while (i >= 0) {
                if (p < k) {
                    d = (this[i] & ((1 << p) - 1)) << (k - p);
                    d |= this[--i] >> (p += this.DB - k);
                }
                else {
                    d = (this[i] >> (p -= k)) & km;
                    if (p <= 0) {
                        p += this.DB;
                        --i;
                    }
                }
                if (d > 0) {
                    m = true;
                }
                if (m) {
                    r += int2char(d);
                }
            }
        }
        return m ? r : "0";
    };
    // BigInteger.prototype.negate = bnNegate;
    // (public) -this
    BigInteger.prototype.negate = function () {
        var r = nbi();
        BigInteger.ZERO.subTo(this, r);
        return r;
    };
    // BigInteger.prototype.abs = bnAbs;
    // (public) |this|
    BigInteger.prototype.abs = function () {
        return (this.s < 0) ? this.negate() : this;
    };
    // BigInteger.prototype.compareTo = bnCompareTo;
    // (public) return + if this > a, - if this < a, 0 if equal
    BigInteger.prototype.compareTo = function (a) {
        var r = this.s - a.s;
        if (r != 0) {
            return r;
        }
        var i = this.t;
        r = i - a.t;
        if (r != 0) {
            return (this.s < 0) ? -r : r;
        }
        while (--i >= 0) {
            if ((r = this[i] - a[i]) != 0) {
                return r;
            }
        }
        return 0;
    };
    // BigInteger.prototype.bitLength = bnBitLength;
    // (public) return the number of bits in "this"
    BigInteger.prototype.bitLength = function () {
        if (this.t <= 0) {
            return 0;
        }
        return this.DB * (this.t - 1) + nbits(this[this.t - 1] ^ (this.s & this.DM));
    };
    // BigInteger.prototype.mod = bnMod;
    // (public) this mod a
    BigInteger.prototype.mod = function (a) {
        var r = nbi();
        this.abs().divRemTo(a, null, r);
        if (this.s < 0 && r.compareTo(BigInteger.ZERO) > 0) {
            a.subTo(r, r);
        }
        return r;
    };
    // BigInteger.prototype.modPowInt = bnModPowInt;
    // (public) this^e % m, 0 <= e < 2^32
    BigInteger.prototype.modPowInt = function (e, m) {
        var z;
        if (e < 256 || m.isEven()) {
            z = new Classic(m);
        }
        else {
            z = new Montgomery(m);
        }
        return this.exp(e, z);
    };
    // BigInteger.prototype.clone = bnClone;
    // (public)
    BigInteger.prototype.clone = function () {
        var r = nbi();
        this.copyTo(r);
        return r;
    };
    // BigInteger.prototype.intValue = bnIntValue;
    // (public) return value as integer
    BigInteger.prototype.intValue = function () {
        if (this.s < 0) {
            if (this.t == 1) {
                return this[0] - this.DV;
            }
            else if (this.t == 0) {
                return -1;
            }
        }
        else if (this.t == 1) {
            return this[0];
        }
        else if (this.t == 0) {
            return 0;
        }
        // assumes 16 < DB < 32
        return ((this[1] & ((1 << (32 - this.DB)) - 1)) << this.DB) | this[0];
    };
    // BigInteger.prototype.byteValue = bnByteValue;
    // (public) return value as byte
    BigInteger.prototype.byteValue = function () {
        return (this.t == 0) ? this.s : (this[0] << 24) >> 24;
    };
    // BigInteger.prototype.shortValue = bnShortValue;
    // (public) return value as short (assumes DB>=16)
    BigInteger.prototype.shortValue = function () {
        return (this.t == 0) ? this.s : (this[0] << 16) >> 16;
    };
    // BigInteger.prototype.signum = bnSigNum;
    // (public) 0 if this == 0, 1 if this > 0
    BigInteger.prototype.signum = function () {
        if (this.s < 0) {
            return -1;
        }
        else if (this.t <= 0 || (this.t == 1 && this[0] <= 0)) {
            return 0;
        }
        else {
            return 1;
        }
    };
    // BigInteger.prototype.toByteArray = bnToByteArray;
    // (public) convert to bigendian byte array
    BigInteger.prototype.toByteArray = function () {
        var i = this.t;
        var r = [];
        r[0] = this.s;
        var p = this.DB - (i * this.DB) % 8;
        var d;
        var k = 0;
        if (i-- > 0) {
            if (p < this.DB && (d = this[i] >> p) != (this.s & this.DM) >> p) {
                r[k++] = d | (this.s << (this.DB - p));
            }
            while (i >= 0) {
                if (p < 8) {
                    d = (this[i] & ((1 << p) - 1)) << (8 - p);
                    d |= this[--i] >> (p += this.DB - 8);
                }
                else {
                    d = (this[i] >> (p -= 8)) & 0xff;
                    if (p <= 0) {
                        p += this.DB;
                        --i;
                    }
                }
                if ((d & 0x80) != 0) {
                    d |= -256;
                }
                if (k == 0 && (this.s & 0x80) != (d & 0x80)) {
                    ++k;
                }
                if (k > 0 || d != this.s) {
                    r[k++] = d;
                }
            }
        }
        return r;
    };
    // BigInteger.prototype.equals = bnEquals;
    BigInteger.prototype.equals = function (a) {
        return (this.compareTo(a) == 0);
    };
    // BigInteger.prototype.min = bnMin;
    BigInteger.prototype.min = function (a) {
        return (this.compareTo(a) < 0) ? this : a;
    };
    // BigInteger.prototype.max = bnMax;
    BigInteger.prototype.max = function (a) {
        return (this.compareTo(a) > 0) ? this : a;
    };
    // BigInteger.prototype.and = bnAnd;
    BigInteger.prototype.and = function (a) {
        var r = nbi();
        this.bitwiseTo(a, op_and, r);
        return r;
    };
    // BigInteger.prototype.or = bnOr;
    BigInteger.prototype.or = function (a) {
        var r = nbi();
        this.bitwiseTo(a, op_or, r);
        return r;
    };
    // BigInteger.prototype.xor = bnXor;
    BigInteger.prototype.xor = function (a) {
        var r = nbi();
        this.bitwiseTo(a, op_xor, r);
        return r;
    };
    // BigInteger.prototype.andNot = bnAndNot;
    BigInteger.prototype.andNot = function (a) {
        var r = nbi();
        this.bitwiseTo(a, op_andnot, r);
        return r;
    };
    // BigInteger.prototype.not = bnNot;
    // (public) ~this
    BigInteger.prototype.not = function () {
        var r = nbi();
        for (var i = 0; i < this.t; ++i) {
            r[i] = this.DM & ~this[i];
        }
        r.t = this.t;
        r.s = ~this.s;
        return r;
    };
    // BigInteger.prototype.shiftLeft = bnShiftLeft;
    // (public) this << n
    BigInteger.prototype.shiftLeft = function (n) {
        var r = nbi();
        if (n < 0) {
            this.rShiftTo(-n, r);
        }
        else {
            this.lShiftTo(n, r);
        }
        return r;
    };
    // BigInteger.prototype.shiftRight = bnShiftRight;
    // (public) this >> n
    BigInteger.prototype.shiftRight = function (n) {
        var r = nbi();
        if (n < 0) {
            this.lShiftTo(-n, r);
        }
        else {
            this.rShiftTo(n, r);
        }
        return r;
    };
    // BigInteger.prototype.getLowestSetBit = bnGetLowestSetBit;
    // (public) returns index of lowest 1-bit (or -1 if none)
    BigInteger.prototype.getLowestSetBit = function () {
        for (var i = 0; i < this.t; ++i) {
            if (this[i] != 0) {
                return i * this.DB + lbit(this[i]);
            }
        }
        if (this.s < 0) {
            return this.t * this.DB;
        }
        return -1;
    };
    // BigInteger.prototype.bitCount = bnBitCount;
    // (public) return number of set bits
    BigInteger.prototype.bitCount = function () {
        var r = 0;
        var x = this.s & this.DM;
        for (var i = 0; i < this.t; ++i) {
            r += cbit(this[i] ^ x);
        }
        return r;
    };
    // BigInteger.prototype.testBit = bnTestBit;
    // (public) true iff nth bit is set
    BigInteger.prototype.testBit = function (n) {
        var j = Math.floor(n / this.DB);
        if (j >= this.t) {
            return (this.s != 0);
        }
        return ((this[j] & (1 << (n % this.DB))) != 0);
    };
    // BigInteger.prototype.setBit = bnSetBit;
    // (public) this | (1<<n)
    BigInteger.prototype.setBit = function (n) {
        return this.changeBit(n, op_or);
    };
    // BigInteger.prototype.clearBit = bnClearBit;
    // (public) this & ~(1<<n)
    BigInteger.prototype.clearBit = function (n) {
        return this.changeBit(n, op_andnot);
    };
    // BigInteger.prototype.flipBit = bnFlipBit;
    // (public) this ^ (1<<n)
    BigInteger.prototype.flipBit = function (n) {
        return this.changeBit(n, op_xor);
    };
    // BigInteger.prototype.add = bnAdd;
    // (public) this + a
    BigInteger.prototype.add = function (a) {
        var r = nbi();
        this.addTo(a, r);
        return r;
    };
    // BigInteger.prototype.subtract = bnSubtract;
    // (public) this - a
    BigInteger.prototype.subtract = function (a) {
        var r = nbi();
        this.subTo(a, r);
        return r;
    };
    // BigInteger.prototype.multiply = bnMultiply;
    // (public) this * a
    BigInteger.prototype.multiply = function (a) {
        var r = nbi();
        this.multiplyTo(a, r);
        return r;
    };
    // BigInteger.prototype.divide = bnDivide;
    // (public) this / a
    BigInteger.prototype.divide = function (a) {
        var r = nbi();
        this.divRemTo(a, r, null);
        return r;
    };
    // BigInteger.prototype.remainder = bnRemainder;
    // (public) this % a
    BigInteger.prototype.remainder = function (a) {
        var r = nbi();
        this.divRemTo(a, null, r);
        return r;
    };
    // BigInteger.prototype.divideAndRemainder = bnDivideAndRemainder;
    // (public) [this/a,this%a]
    BigInteger.prototype.divideAndRemainder = function (a) {
        var q = nbi();
        var r = nbi();
        this.divRemTo(a, q, r);
        return [q, r];
    };
    // BigInteger.prototype.modPow = bnModPow;
    // (public) this^e % m (HAC 14.85)
    BigInteger.prototype.modPow = function (e, m) {
        var i = e.bitLength();
        var k;
        var r = nbv(1);
        var z;
        if (i <= 0) {
            return r;
        }
        else if (i < 18) {
            k = 1;
        }
        else if (i < 48) {
            k = 3;
        }
        else if (i < 144) {
            k = 4;
        }
        else if (i < 768) {
            k = 5;
        }
        else {
            k = 6;
        }
        if (i < 8) {
            z = new Classic(m);
        }
        else if (m.isEven()) {
            z = new Barrett(m);
        }
        else {
            z = new Montgomery(m);
        }
        // precomputation
        var g = [];
        var n = 3;
        var k1 = k - 1;
        var km = (1 << k) - 1;
        g[1] = z.convert(this);
        if (k > 1) {
            var g2 = nbi();
            z.sqrTo(g[1], g2);
            while (n <= km) {
                g[n] = nbi();
                z.mulTo(g2, g[n - 2], g[n]);
                n += 2;
            }
        }
        var j = e.t - 1;
        var w;
        var is1 = true;
        var r2 = nbi();
        var t;
        i = nbits(e[j]) - 1;
        while (j >= 0) {
            if (i >= k1) {
                w = (e[j] >> (i - k1)) & km;
            }
            else {
                w = (e[j] & ((1 << (i + 1)) - 1)) << (k1 - i);
                if (j > 0) {
                    w |= e[j - 1] >> (this.DB + i - k1);
                }
            }
            n = k;
            while ((w & 1) == 0) {
                w >>= 1;
                --n;
            }
            if ((i -= n) < 0) {
                i += this.DB;
                --j;
            }
            if (is1) { // ret == 1, don't bother squaring or multiplying it
                g[w].copyTo(r);
                is1 = false;
            }
            else {
                while (n > 1) {
                    z.sqrTo(r, r2);
                    z.sqrTo(r2, r);
                    n -= 2;
                }
                if (n > 0) {
                    z.sqrTo(r, r2);
                }
                else {
                    t = r;
                    r = r2;
                    r2 = t;
                }
                z.mulTo(r2, g[w], r);
            }
            while (j >= 0 && (e[j] & (1 << i)) == 0) {
                z.sqrTo(r, r2);
                t = r;
                r = r2;
                r2 = t;
                if (--i < 0) {
                    i = this.DB - 1;
                    --j;
                }
            }
        }
        return z.revert(r);
    };
    // BigInteger.prototype.modInverse = bnModInverse;
    // (public) 1/this % m (HAC 14.61)
    BigInteger.prototype.modInverse = function (m) {
        var ac = m.isEven();
        if ((this.isEven() && ac) || m.signum() == 0) {
            return BigInteger.ZERO;
        }
        var u = m.clone();
        var v = this.clone();
        var a = nbv(1);
        var b = nbv(0);
        var c = nbv(0);
        var d = nbv(1);
        while (u.signum() != 0) {
            while (u.isEven()) {
                u.rShiftTo(1, u);
                if (ac) {
                    if (!a.isEven() || !b.isEven()) {
                        a.addTo(this, a);
                        b.subTo(m, b);
                    }
                    a.rShiftTo(1, a);
                }
                else if (!b.isEven()) {
                    b.subTo(m, b);
                }
                b.rShiftTo(1, b);
            }
            while (v.isEven()) {
                v.rShiftTo(1, v);
                if (ac) {
                    if (!c.isEven() || !d.isEven()) {
                        c.addTo(this, c);
                        d.subTo(m, d);
                    }
                    c.rShiftTo(1, c);
                }
                else if (!d.isEven()) {
                    d.subTo(m, d);
                }
                d.rShiftTo(1, d);
            }
            if (u.compareTo(v) >= 0) {
                u.subTo(v, u);
                if (ac) {
                    a.subTo(c, a);
                }
                b.subTo(d, b);
            }
            else {
                v.subTo(u, v);
                if (ac) {
                    c.subTo(a, c);
                }
                d.subTo(b, d);
            }
        }
        if (v.compareTo(BigInteger.ONE) != 0) {
            return BigInteger.ZERO;
        }
        if (d.compareTo(m) >= 0) {
            return d.subtract(m);
        }
        if (d.signum() < 0) {
            d.addTo(m, d);
        }
        else {
            return d;
        }
        if (d.signum() < 0) {
            return d.add(m);
        }
        else {
            return d;
        }
    };
    // BigInteger.prototype.pow = bnPow;
    // (public) this^e
    BigInteger.prototype.pow = function (e) {
        return this.exp(e, new NullExp());
    };
    // BigInteger.prototype.gcd = bnGCD;
    // (public) gcd(this,a) (HAC 14.54)
    BigInteger.prototype.gcd = function (a) {
        var x = (this.s < 0) ? this.negate() : this.clone();
        var y = (a.s < 0) ? a.negate() : a.clone();
        if (x.compareTo(y) < 0) {
            var t = x;
            x = y;
            y = t;
        }
        var i = x.getLowestSetBit();
        var g = y.getLowestSetBit();
        if (g < 0) {
            return x;
        }
        if (i < g) {
            g = i;
        }
        if (g > 0) {
            x.rShiftTo(g, x);
            y.rShiftTo(g, y);
        }
        while (x.signum() > 0) {
            if ((i = x.getLowestSetBit()) > 0) {
                x.rShiftTo(i, x);
            }
            if ((i = y.getLowestSetBit()) > 0) {
                y.rShiftTo(i, y);
            }
            if (x.compareTo(y) >= 0) {
                x.subTo(y, x);
                x.rShiftTo(1, x);
            }
            else {
                y.subTo(x, y);
                y.rShiftTo(1, y);
            }
        }
        if (g > 0) {
            y.lShiftTo(g, y);
        }
        return y;
    };
    // BigInteger.prototype.isProbablePrime = bnIsProbablePrime;
    // (public) test primality with certainty >= 1-.5^t
    BigInteger.prototype.isProbablePrime = function (t) {
        var i;
        var x = this.abs();
        if (x.t == 1 && x[0] <= lowprimes[lowprimes.length - 1]) {
            for (i = 0; i < lowprimes.length; ++i) {
                if (x[0] == lowprimes[i]) {
                    return true;
                }
            }
            return false;
        }
        if (x.isEven()) {
            return false;
        }
        i = 1;
        while (i < lowprimes.length) {
            var m = lowprimes[i];
            var j = i + 1;
            while (j < lowprimes.length && m < lplim) {
                m *= lowprimes[j++];
            }
            m = x.modInt(m);
            while (i < j) {
                if (m % lowprimes[i++] == 0) {
                    return false;
                }
            }
        }
        return x.millerRabin(t);
    };
    //#endregion PUBLIC
    //#region PROTECTED
    // BigInteger.prototype.copyTo = bnpCopyTo;
    // (protected) copy this to r
    BigInteger.prototype.copyTo = function (r) {
        for (var i = this.t - 1; i >= 0; --i) {
            r[i] = this[i];
        }
        r.t = this.t;
        r.s = this.s;
    };
    // BigInteger.prototype.fromInt = bnpFromInt;
    // (protected) set from integer value x, -DV <= x < DV
    BigInteger.prototype.fromInt = function (x) {
        this.t = 1;
        this.s = (x < 0) ? -1 : 0;
        if (x > 0) {
            this[0] = x;
        }
        else if (x < -1) {
            this[0] = x + this.DV;
        }
        else {
            this.t = 0;
        }
    };
    // BigInteger.prototype.fromString = bnpFromString;
    // (protected) set from string and radix
    BigInteger.prototype.fromString = function (s, b) {
        var k;
        if (b == 16) {
            k = 4;
        }
        else if (b == 8) {
            k = 3;
        }
        else if (b == 256) {
            k = 8;
            /* byte array */
        }
        else if (b == 2) {
            k = 1;
        }
        else if (b == 32) {
            k = 5;
        }
        else if (b == 4) {
            k = 2;
        }
        else {
            this.fromRadix(s, b);
            return;
        }
        this.t = 0;
        this.s = 0;
        var i = s.length;
        var mi = false;
        var sh = 0;
        while (--i >= 0) {
            var x = (k == 8) ? (+s[i]) & 0xff : intAt(s, i);
            if (x < 0) {
                if (s.charAt(i) == "-") {
                    mi = true;
                }
                continue;
            }
            mi = false;
            if (sh == 0) {
                this[this.t++] = x;
            }
            else if (sh + k > this.DB) {
                this[this.t - 1] |= (x & ((1 << (this.DB - sh)) - 1)) << sh;
                this[this.t++] = (x >> (this.DB - sh));
            }
            else {
                this[this.t - 1] |= x << sh;
            }
            sh += k;
            if (sh >= this.DB) {
                sh -= this.DB;
            }
        }
        if (k == 8 && ((+s[0]) & 0x80) != 0) {
            this.s = -1;
            if (sh > 0) {
                this[this.t - 1] |= ((1 << (this.DB - sh)) - 1) << sh;
            }
        }
        this.clamp();
        if (mi) {
            BigInteger.ZERO.subTo(this, this);
        }
    };
    // BigInteger.prototype.clamp = bnpClamp;
    // (protected) clamp off excess high words
    BigInteger.prototype.clamp = function () {
        var c = this.s & this.DM;
        while (this.t > 0 && this[this.t - 1] == c) {
            --this.t;
        }
    };
    // BigInteger.prototype.dlShiftTo = bnpDLShiftTo;
    // (protected) r = this << n*DB
    BigInteger.prototype.dlShiftTo = function (n, r) {
        var i;
        for (i = this.t - 1; i >= 0; --i) {
            r[i + n] = this[i];
        }
        for (i = n - 1; i >= 0; --i) {
            r[i] = 0;
        }
        r.t = this.t + n;
        r.s = this.s;
    };
    // BigInteger.prototype.drShiftTo = bnpDRShiftTo;
    // (protected) r = this >> n*DB
    BigInteger.prototype.drShiftTo = function (n, r) {
        for (var i = n; i < this.t; ++i) {
            r[i - n] = this[i];
        }
        r.t = Math.max(this.t - n, 0);
        r.s = this.s;
    };
    // BigInteger.prototype.lShiftTo = bnpLShiftTo;
    // (protected) r = this << n
    BigInteger.prototype.lShiftTo = function (n, r) {
        var bs = n % this.DB;
        var cbs = this.DB - bs;
        var bm = (1 << cbs) - 1;
        var ds = Math.floor(n / this.DB);
        var c = (this.s << bs) & this.DM;
        for (var i = this.t - 1; i >= 0; --i) {
            r[i + ds + 1] = (this[i] >> cbs) | c;
            c = (this[i] & bm) << bs;
        }
        for (var i = ds - 1; i >= 0; --i) {
            r[i] = 0;
        }
        r[ds] = c;
        r.t = this.t + ds + 1;
        r.s = this.s;
        r.clamp();
    };
    // BigInteger.prototype.rShiftTo = bnpRShiftTo;
    // (protected) r = this >> n
    BigInteger.prototype.rShiftTo = function (n, r) {
        r.s = this.s;
        var ds = Math.floor(n / this.DB);
        if (ds >= this.t) {
            r.t = 0;
            return;
        }
        var bs = n % this.DB;
        var cbs = this.DB - bs;
        var bm = (1 << bs) - 1;
        r[0] = this[ds] >> bs;
        for (var i = ds + 1; i < this.t; ++i) {
            r[i - ds - 1] |= (this[i] & bm) << cbs;
            r[i - ds] = this[i] >> bs;
        }
        if (bs > 0) {
            r[this.t - ds - 1] |= (this.s & bm) << cbs;
        }
        r.t = this.t - ds;
        r.clamp();
    };
    // BigInteger.prototype.subTo = bnpSubTo;
    // (protected) r = this - a
    BigInteger.prototype.subTo = function (a, r) {
        var i = 0;
        var c = 0;
        var m = Math.min(a.t, this.t);
        while (i < m) {
            c += this[i] - a[i];
            r[i++] = c & this.DM;
            c >>= this.DB;
        }
        if (a.t < this.t) {
            c -= a.s;
            while (i < this.t) {
                c += this[i];
                r[i++] = c & this.DM;
                c >>= this.DB;
            }
            c += this.s;
        }
        else {
            c += this.s;
            while (i < a.t) {
                c -= a[i];
                r[i++] = c & this.DM;
                c >>= this.DB;
            }
            c -= a.s;
        }
        r.s = (c < 0) ? -1 : 0;
        if (c < -1) {
            r[i++] = this.DV + c;
        }
        else if (c > 0) {
            r[i++] = c;
        }
        r.t = i;
        r.clamp();
    };
    // BigInteger.prototype.multiplyTo = bnpMultiplyTo;
    // (protected) r = this * a, r != this,a (HAC 14.12)
    // "this" should be the larger one if appropriate.
    BigInteger.prototype.multiplyTo = function (a, r) {
        var x = this.abs();
        var y = a.abs();
        var i = x.t;
        r.t = i + y.t;
        while (--i >= 0) {
            r[i] = 0;
        }
        for (i = 0; i < y.t; ++i) {
            r[i + x.t] = x.am(0, y[i], r, i, 0, x.t);
        }
        r.s = 0;
        r.clamp();
        if (this.s != a.s) {
            BigInteger.ZERO.subTo(r, r);
        }
    };
    // BigInteger.prototype.squareTo = bnpSquareTo;
    // (protected) r = this^2, r != this (HAC 14.16)
    BigInteger.prototype.squareTo = function (r) {
        var x = this.abs();
        var i = r.t = 2 * x.t;
        while (--i >= 0) {
            r[i] = 0;
        }
        for (i = 0; i < x.t - 1; ++i) {
            var c = x.am(i, x[i], r, 2 * i, 0, 1);
            if ((r[i + x.t] += x.am(i + 1, 2 * x[i], r, 2 * i + 1, c, x.t - i - 1)) >= x.DV) {
                r[i + x.t] -= x.DV;
                r[i + x.t + 1] = 1;
            }
        }
        if (r.t > 0) {
            r[r.t - 1] += x.am(i, x[i], r, 2 * i, 0, 1);
        }
        r.s = 0;
        r.clamp();
    };
    // BigInteger.prototype.divRemTo = bnpDivRemTo;
    // (protected) divide this by m, quotient and remainder to q, r (HAC 14.20)
    // r != q, this != m.  q or r may be null.
    BigInteger.prototype.divRemTo = function (m, q, r) {
        var pm = m.abs();
        if (pm.t <= 0) {
            return;
        }
        var pt = this.abs();
        if (pt.t < pm.t) {
            if (q != null) {
                q.fromInt(0);
            }
            if (r != null) {
                this.copyTo(r);
            }
            return;
        }
        if (r == null) {
            r = nbi();
        }
        var y = nbi();
        var ts = this.s;
        var ms = m.s;
        var nsh = this.DB - nbits(pm[pm.t - 1]); // normalize modulus
        if (nsh > 0) {
            pm.lShiftTo(nsh, y);
            pt.lShiftTo(nsh, r);
        }
        else {
            pm.copyTo(y);
            pt.copyTo(r);
        }
        var ys = y.t;
        var y0 = y[ys - 1];
        if (y0 == 0) {
            return;
        }
        var yt = y0 * (1 << this.F1) + ((ys > 1) ? y[ys - 2] >> this.F2 : 0);
        var d1 = this.FV / yt;
        var d2 = (1 << this.F1) / yt;
        var e = 1 << this.F2;
        var i = r.t;
        var j = i - ys;
        var t = (q == null) ? nbi() : q;
        y.dlShiftTo(j, t);
        if (r.compareTo(t) >= 0) {
            r[r.t++] = 1;
            r.subTo(t, r);
        }
        BigInteger.ONE.dlShiftTo(ys, t);
        t.subTo(y, y); // "negative" y so we can replace sub with am later
        while (y.t < ys) {
            y[y.t++] = 0;
        }
        while (--j >= 0) {
            // Estimate quotient digit
            var qd = (r[--i] == y0) ? this.DM : Math.floor(r[i] * d1 + (r[i - 1] + e) * d2);
            if ((r[i] += y.am(0, qd, r, j, 0, ys)) < qd) { // Try it out
                y.dlShiftTo(j, t);
                r.subTo(t, r);
                while (r[i] < --qd) {
                    r.subTo(t, r);
                }
            }
        }
        if (q != null) {
            r.drShiftTo(ys, q);
            if (ts != ms) {
                BigInteger.ZERO.subTo(q, q);
            }
        }
        r.t = ys;
        r.clamp();
        if (nsh > 0) {
            r.rShiftTo(nsh, r);
        } // Denormalize remainder
        if (ts < 0) {
            BigInteger.ZERO.subTo(r, r);
        }
    };
    // BigInteger.prototype.invDigit = bnpInvDigit;
    // (protected) return "-1/this % 2^DB"; useful for Mont. reduction
    // justification:
    //         xy == 1 (mod m)
    //         xy =  1+km
    //   xy(2-xy) = (1+km)(1-km)
    // x[y(2-xy)] = 1-k^2m^2
    // x[y(2-xy)] == 1 (mod m^2)
    // if y is 1/x mod m, then y(2-xy) is 1/x mod m^2
    // should reduce x and y(2-xy) by m^2 at each step to keep size bounded.
    // JS multiply "overflows" differently from C/C++, so care is needed here.
    BigInteger.prototype.invDigit = function () {
        if (this.t < 1) {
            return 0;
        }
        var x = this[0];
        if ((x & 1) == 0) {
            return 0;
        }
        var y = x & 3; // y == 1/x mod 2^2
        y = (y * (2 - (x & 0xf) * y)) & 0xf; // y == 1/x mod 2^4
        y = (y * (2 - (x & 0xff) * y)) & 0xff; // y == 1/x mod 2^8
        y = (y * (2 - (((x & 0xffff) * y) & 0xffff))) & 0xffff; // y == 1/x mod 2^16
        // last step - calculate inverse mod DV directly;
        // assumes 16 < DB <= 32 and assumes ability to handle 48-bit ints
        y = (y * (2 - x * y % this.DV)) % this.DV; // y == 1/x mod 2^dbits
        // we really want the negative inverse, and -DV < y < DV
        return (y > 0) ? this.DV - y : -y;
    };
    // BigInteger.prototype.isEven = bnpIsEven;
    // (protected) true iff this is even
    BigInteger.prototype.isEven = function () {
        return ((this.t > 0) ? (this[0] & 1) : this.s) == 0;
    };
    // BigInteger.prototype.exp = bnpExp;
    // (protected) this^e, e < 2^32, doing sqr and mul with "r" (HAC 14.79)
    BigInteger.prototype.exp = function (e, z) {
        if (e > 0xffffffff || e < 1) {
            return BigInteger.ONE;
        }
        var r = nbi();
        var r2 = nbi();
        var g = z.convert(this);
        var i = nbits(e) - 1;
        g.copyTo(r);
        while (--i >= 0) {
            z.sqrTo(r, r2);
            if ((e & (1 << i)) > 0) {
                z.mulTo(r2, g, r);
            }
            else {
                var t = r;
                r = r2;
                r2 = t;
            }
        }
        return z.revert(r);
    };
    // BigInteger.prototype.chunkSize = bnpChunkSize;
    // (protected) return x s.t. r^x < DV
    BigInteger.prototype.chunkSize = function (r) {
        return Math.floor(Math.LN2 * this.DB / Math.log(r));
    };
    // BigInteger.prototype.toRadix = bnpToRadix;
    // (protected) convert to radix string
    BigInteger.prototype.toRadix = function (b) {
        if (b == null) {
            b = 10;
        }
        if (this.signum() == 0 || b < 2 || b > 36) {
            return "0";
        }
        var cs = this.chunkSize(b);
        var a = Math.pow(b, cs);
        var d = nbv(a);
        var y = nbi();
        var z = nbi();
        var r = "";
        this.divRemTo(d, y, z);
        while (y.signum() > 0) {
            r = (a + z.intValue()).toString(b).substr(1) + r;
            y.divRemTo(d, y, z);
        }
        return z.intValue().toString(b) + r;
    };
    // BigInteger.prototype.fromRadix = bnpFromRadix;
    // (protected) convert from radix string
    BigInteger.prototype.fromRadix = function (s, b) {
        this.fromInt(0);
        if (b == null) {
            b = 10;
        }
        var cs = this.chunkSize(b);
        var d = Math.pow(b, cs);
        var mi = false;
        var j = 0;
        var w = 0;
        for (var i = 0; i < s.length; ++i) {
            var x = intAt(s, i);
            if (x < 0) {
                if (s.charAt(i) == "-" && this.signum() == 0) {
                    mi = true;
                }
                continue;
            }
            w = b * w + x;
            if (++j >= cs) {
                this.dMultiply(d);
                this.dAddOffset(w, 0);
                j = 0;
                w = 0;
            }
        }
        if (j > 0) {
            this.dMultiply(Math.pow(b, j));
            this.dAddOffset(w, 0);
        }
        if (mi) {
            BigInteger.ZERO.subTo(this, this);
        }
    };
    // BigInteger.prototype.fromNumber = bnpFromNumber;
    // (protected) alternate constructor
    BigInteger.prototype.fromNumber = function (a, b, c) {
        if ("number" == typeof b) {
            // new BigInteger(int,int,RNG)
            if (a < 2) {
                this.fromInt(1);
            }
            else {
                this.fromNumber(a, c);
                if (!this.testBit(a - 1)) {
                    // force MSB set
                    this.bitwiseTo(BigInteger.ONE.shiftLeft(a - 1), op_or, this);
                }
                if (this.isEven()) {
                    this.dAddOffset(1, 0);
                } // force odd
                while (!this.isProbablePrime(b)) {
                    this.dAddOffset(2, 0);
                    if (this.bitLength() > a) {
                        this.subTo(BigInteger.ONE.shiftLeft(a - 1), this);
                    }
                }
            }
        }
        else {
            // new BigInteger(int,RNG)
            var x = [];
            var t = a & 7;
            x.length = (a >> 3) + 1;
            b.nextBytes(x);
            if (t > 0) {
                x[0] &= ((1 << t) - 1);
            }
            else {
                x[0] = 0;
            }
            this.fromString(x, 256);
        }
    };
    // BigInteger.prototype.bitwiseTo = bnpBitwiseTo;
    // (protected) r = this op a (bitwise)
    BigInteger.prototype.bitwiseTo = function (a, op, r) {
        var i;
        var f;
        var m = Math.min(a.t, this.t);
        for (i = 0; i < m; ++i) {
            r[i] = op(this[i], a[i]);
        }
        if (a.t < this.t) {
            f = a.s & this.DM;
            for (i = m; i < this.t; ++i) {
                r[i] = op(this[i], f);
            }
            r.t = this.t;
        }
        else {
            f = this.s & this.DM;
            for (i = m; i < a.t; ++i) {
                r[i] = op(f, a[i]);
            }
            r.t = a.t;
        }
        r.s = op(this.s, a.s);
        r.clamp();
    };
    // BigInteger.prototype.changeBit = bnpChangeBit;
    // (protected) this op (1<<n)
    BigInteger.prototype.changeBit = function (n, op) {
        var r = BigInteger.ONE.shiftLeft(n);
        this.bitwiseTo(r, op, r);
        return r;
    };
    // BigInteger.prototype.addTo = bnpAddTo;
    // (protected) r = this + a
    BigInteger.prototype.addTo = function (a, r) {
        var i = 0;
        var c = 0;
        var m = Math.min(a.t, this.t);
        while (i < m) {
            c += this[i] + a[i];
            r[i++] = c & this.DM;
            c >>= this.DB;
        }
        if (a.t < this.t) {
            c += a.s;
            while (i < this.t) {
                c += this[i];
                r[i++] = c & this.DM;
                c >>= this.DB;
            }
            c += this.s;
        }
        else {
            c += this.s;
            while (i < a.t) {
                c += a[i];
                r[i++] = c & this.DM;
                c >>= this.DB;
            }
            c += a.s;
        }
        r.s = (c < 0) ? -1 : 0;
        if (c > 0) {
            r[i++] = c;
        }
        else if (c < -1) {
            r[i++] = this.DV + c;
        }
        r.t = i;
        r.clamp();
    };
    // BigInteger.prototype.dMultiply = bnpDMultiply;
    // (protected) this *= n, this >= 0, 1 < n < DV
    BigInteger.prototype.dMultiply = function (n) {
        this[this.t] = this.am(0, n - 1, this, 0, 0, this.t);
        ++this.t;
        this.clamp();
    };
    // BigInteger.prototype.dAddOffset = bnpDAddOffset;
    // (protected) this += n << w words, this >= 0
    BigInteger.prototype.dAddOffset = function (n, w) {
        if (n == 0) {
            return;
        }
        while (this.t <= w) {
            this[this.t++] = 0;
        }
        this[w] += n;
        while (this[w] >= this.DV) {
            this[w] -= this.DV;
            if (++w >= this.t) {
                this[this.t++] = 0;
            }
            ++this[w];
        }
    };
    // BigInteger.prototype.multiplyLowerTo = bnpMultiplyLowerTo;
    // (protected) r = lower n words of "this * a", a.t <= n
    // "this" should be the larger one if appropriate.
    BigInteger.prototype.multiplyLowerTo = function (a, n, r) {
        var i = Math.min(this.t + a.t, n);
        r.s = 0; // assumes a,this >= 0
        r.t = i;
        while (i > 0) {
            r[--i] = 0;
        }
        for (var j = r.t - this.t; i < j; ++i) {
            r[i + this.t] = this.am(0, a[i], r, i, 0, this.t);
        }
        for (var j = Math.min(a.t, n); i < j; ++i) {
            this.am(0, a[i], r, i, 0, n - i);
        }
        r.clamp();
    };
    // BigInteger.prototype.multiplyUpperTo = bnpMultiplyUpperTo;
    // (protected) r = "this * a" without lower n words, n > 0
    // "this" should be the larger one if appropriate.
    BigInteger.prototype.multiplyUpperTo = function (a, n, r) {
        --n;
        var i = r.t = this.t + a.t - n;
        r.s = 0; // assumes a,this >= 0
        while (--i >= 0) {
            r[i] = 0;
        }
        for (i = Math.max(n - this.t, 0); i < a.t; ++i) {
            r[this.t + i - n] = this.am(n - i, a[i], r, 0, 0, this.t + i - n);
        }
        r.clamp();
        r.drShiftTo(1, r);
    };
    // BigInteger.prototype.modInt = bnpModInt;
    // (protected) this % n, n < 2^26
    BigInteger.prototype.modInt = function (n) {
        if (n <= 0) {
            return 0;
        }
        var d = this.DV % n;
        var r = (this.s < 0) ? n - 1 : 0;
        if (this.t > 0) {
            if (d == 0) {
                r = this[0] % n;
            }
            else {
                for (var i = this.t - 1; i >= 0; --i) {
                    r = (d * r + this[i]) % n;
                }
            }
        }
        return r;
    };
    // BigInteger.prototype.millerRabin = bnpMillerRabin;
    // (protected) true if probably prime (HAC 4.24, Miller-Rabin)
    BigInteger.prototype.millerRabin = function (t) {
        var n1 = this.subtract(BigInteger.ONE);
        var k = n1.getLowestSetBit();
        if (k <= 0) {
            return false;
        }
        var r = n1.shiftRight(k);
        t = (t + 1) >> 1;
        if (t > lowprimes.length) {
            t = lowprimes.length;
        }
        var a = nbi();
        for (var i = 0; i < t; ++i) {
            // Pick bases at random, instead of starting at 2
            a.fromInt(lowprimes[Math.floor(Math.random() * lowprimes.length)]);
            var y = a.modPow(r, this);
            if (y.compareTo(BigInteger.ONE) != 0 && y.compareTo(n1) != 0) {
                var j = 1;
                while (j++ < k && y.compareTo(n1) != 0) {
                    y = y.modPowInt(2, this);
                    if (y.compareTo(BigInteger.ONE) == 0) {
                        return false;
                    }
                }
                if (y.compareTo(n1) != 0) {
                    return false;
                }
            }
        }
        return true;
    };
    // BigInteger.prototype.square = bnSquare;
    // (public) this^2
    BigInteger.prototype.square = function () {
        var r = nbi();
        this.squareTo(r);
        return r;
    };
    //#region ASYNC
    // Public API method
    BigInteger.prototype.gcda = function (a, callback) {
        var x = (this.s < 0) ? this.negate() : this.clone();
        var y = (a.s < 0) ? a.negate() : a.clone();
        if (x.compareTo(y) < 0) {
            var t = x;
            x = y;
            y = t;
        }
        var i = x.getLowestSetBit();
        var g = y.getLowestSetBit();
        if (g < 0) {
            callback(x);
            return;
        }
        if (i < g) {
            g = i;
        }
        if (g > 0) {
            x.rShiftTo(g, x);
            y.rShiftTo(g, y);
        }
        // Workhorse of the algorithm, gets called 200 - 800 times per 512 bit keygen.
        var gcda1 = function () {
            if ((i = x.getLowestSetBit()) > 0) {
                x.rShiftTo(i, x);
            }
            if ((i = y.getLowestSetBit()) > 0) {
                y.rShiftTo(i, y);
            }
            if (x.compareTo(y) >= 0) {
                x.subTo(y, x);
                x.rShiftTo(1, x);
            }
            else {
                y.subTo(x, y);
                y.rShiftTo(1, y);
            }
            if (!(x.signum() > 0)) {
                if (g > 0) {
                    y.lShiftTo(g, y);
                }
                setTimeout(function () { callback(y); }, 0); // escape
            }
            else {
                setTimeout(gcda1, 0);
            }
        };
        setTimeout(gcda1, 10);
    };
    // (protected) alternate constructor
    BigInteger.prototype.fromNumberAsync = function (a, b, c, callback) {
        if ("number" == typeof b) {
            if (a < 2) {
                this.fromInt(1);
            }
            else {
                this.fromNumber(a, c);
                if (!this.testBit(a - 1)) {
                    this.bitwiseTo(BigInteger.ONE.shiftLeft(a - 1), op_or, this);
                }
                if (this.isEven()) {
                    this.dAddOffset(1, 0);
                }
                var bnp_1 = this;
                var bnpfn1_1 = function () {
                    bnp_1.dAddOffset(2, 0);
                    if (bnp_1.bitLength() > a) {
                        bnp_1.subTo(BigInteger.ONE.shiftLeft(a - 1), bnp_1);
                    }
                    if (bnp_1.isProbablePrime(b)) {
                        setTimeout(function () { callback(); }, 0); // escape
                    }
                    else {
                        setTimeout(bnpfn1_1, 0);
                    }
                };
                setTimeout(bnpfn1_1, 0);
            }
        }
        else {
            var x = [];
            var t = a & 7;
            x.length = (a >> 3) + 1;
            b.nextBytes(x);
            if (t > 0) {
                x[0] &= ((1 << t) - 1);
            }
            else {
                x[0] = 0;
            }
            this.fromString(x, 256);
        }
    };
    return BigInteger;
}());
//#region REDUCERS
//#region NullExp
var NullExp = /** @class */ (function () {
    function NullExp() {
    }
    // NullExp.prototype.convert = nNop;
    NullExp.prototype.convert = function (x) {
        return x;
    };
    // NullExp.prototype.revert = nNop;
    NullExp.prototype.revert = function (x) {
        return x;
    };
    // NullExp.prototype.mulTo = nMulTo;
    NullExp.prototype.mulTo = function (x, y, r) {
        x.multiplyTo(y, r);
    };
    // NullExp.prototype.sqrTo = nSqrTo;
    NullExp.prototype.sqrTo = function (x, r) {
        x.squareTo(r);
    };
    return NullExp;
}());
// Modular reduction using "classic" algorithm
var Classic = /** @class */ (function () {
    function Classic(m) {
        this.m = m;
    }
    // Classic.prototype.convert = cConvert;
    Classic.prototype.convert = function (x) {
        if (x.s < 0 || x.compareTo(this.m) >= 0) {
            return x.mod(this.m);
        }
        else {
            return x;
        }
    };
    // Classic.prototype.revert = cRevert;
    Classic.prototype.revert = function (x) {
        return x;
    };
    // Classic.prototype.reduce = cReduce;
    Classic.prototype.reduce = function (x) {
        x.divRemTo(this.m, null, x);
    };
    // Classic.prototype.mulTo = cMulTo;
    Classic.prototype.mulTo = function (x, y, r) {
        x.multiplyTo(y, r);
        this.reduce(r);
    };
    // Classic.prototype.sqrTo = cSqrTo;
    Classic.prototype.sqrTo = function (x, r) {
        x.squareTo(r);
        this.reduce(r);
    };
    return Classic;
}());
//#endregion
//#region Montgomery
// Montgomery reduction
var Montgomery = /** @class */ (function () {
    function Montgomery(m) {
        this.m = m;
        this.mp = m.invDigit();
        this.mpl = this.mp & 0x7fff;
        this.mph = this.mp >> 15;
        this.um = (1 << (m.DB - 15)) - 1;
        this.mt2 = 2 * m.t;
    }
    // Montgomery.prototype.convert = montConvert;
    // xR mod m
    Montgomery.prototype.convert = function (x) {
        var r = nbi();
        x.abs().dlShiftTo(this.m.t, r);
        r.divRemTo(this.m, null, r);
        if (x.s < 0 && r.compareTo(BigInteger.ZERO) > 0) {
            this.m.subTo(r, r);
        }
        return r;
    };
    // Montgomery.prototype.revert = montRevert;
    // x/R mod m
    Montgomery.prototype.revert = function (x) {
        var r = nbi();
        x.copyTo(r);
        this.reduce(r);
        return r;
    };
    // Montgomery.prototype.reduce = montReduce;
    // x = x/R mod m (HAC 14.32)
    Montgomery.prototype.reduce = function (x) {
        while (x.t <= this.mt2) {
            // pad x so am has enough room later
            x[x.t++] = 0;
        }
        for (var i = 0; i < this.m.t; ++i) {
            // faster way of calculating u0 = x[i]*mp mod DV
            var j = x[i] & 0x7fff;
            var u0 = (j * this.mpl + (((j * this.mph + (x[i] >> 15) * this.mpl) & this.um) << 15)) & x.DM;
            // use am to combine the multiply-shift-add into one call
            j = i + this.m.t;
            x[j] += this.m.am(0, u0, x, i, 0, this.m.t);
            // propagate carry
            while (x[j] >= x.DV) {
                x[j] -= x.DV;
                x[++j]++;
            }
        }
        x.clamp();
        x.drShiftTo(this.m.t, x);
        if (x.compareTo(this.m) >= 0) {
            x.subTo(this.m, x);
        }
    };
    // Montgomery.prototype.mulTo = montMulTo;
    // r = "xy/R mod m"; x,y != r
    Montgomery.prototype.mulTo = function (x, y, r) {
        x.multiplyTo(y, r);
        this.reduce(r);
    };
    // Montgomery.prototype.sqrTo = montSqrTo;
    // r = "x^2/R mod m"; x != r
    Montgomery.prototype.sqrTo = function (x, r) {
        x.squareTo(r);
        this.reduce(r);
    };
    return Montgomery;
}());
//#endregion Montgomery
//#region Barrett
// Barrett modular reduction
var Barrett = /** @class */ (function () {
    function Barrett(m) {
        this.m = m;
        // setup Barrett
        this.r2 = nbi();
        this.q3 = nbi();
        BigInteger.ONE.dlShiftTo(2 * m.t, this.r2);
        this.mu = this.r2.divide(m);
    }
    // Barrett.prototype.convert = barrettConvert;
    Barrett.prototype.convert = function (x) {
        if (x.s < 0 || x.t > 2 * this.m.t) {
            return x.mod(this.m);
        }
        else if (x.compareTo(this.m) < 0) {
            return x;
        }
        else {
            var r = nbi();
            x.copyTo(r);
            this.reduce(r);
            return r;
        }
    };
    // Barrett.prototype.revert = barrettRevert;
    Barrett.prototype.revert = function (x) {
        return x;
    };
    // Barrett.prototype.reduce = barrettReduce;
    // x = x mod m (HAC 14.42)
    Barrett.prototype.reduce = function (x) {
        x.drShiftTo(this.m.t - 1, this.r2);
        if (x.t > this.m.t + 1) {
            x.t = this.m.t + 1;
            x.clamp();
        }
        this.mu.multiplyUpperTo(this.r2, this.m.t + 1, this.q3);
        this.m.multiplyLowerTo(this.q3, this.m.t + 1, this.r2);
        while (x.compareTo(this.r2) < 0) {
            x.dAddOffset(1, this.m.t + 1);
        }
        x.subTo(this.r2, x);
        while (x.compareTo(this.m) >= 0) {
            x.subTo(this.m, x);
        }
    };
    // Barrett.prototype.mulTo = barrettMulTo;
    // r = x*y mod m; x,y != r
    Barrett.prototype.mulTo = function (x, y, r) {
        x.multiplyTo(y, r);
        this.reduce(r);
    };
    // Barrett.prototype.sqrTo = barrettSqrTo;
    // r = x^2 mod m; x != r
    Barrett.prototype.sqrTo = function (x, r) {
        x.squareTo(r);
        this.reduce(r);
    };
    return Barrett;
}());
//#endregion
//#endregion REDUCERS
// return new, unset BigInteger
function nbi() { return new BigInteger(null); }
function parseBigInt(str, r) {
    return new BigInteger(str, r);
}
// am: Compute w_j += (x*this_i), propagate carries,
// c is initial carry, returns final carry.
// c < 3*dvalue, x < 2*dvalue, this_i < dvalue
// We need to select the fastest one that works in this environment.
// am1: use a single mult and divide to get the high bits,
// max digit bits should be 26 because
// max internal value = 2*dvalue^2-2*dvalue (< 2^53)
function am1(i, x, w, j, c, n) {
    while (--n >= 0) {
        var v = x * this[i++] + w[j] + c;
        c = Math.floor(v / 0x4000000);
        w[j++] = v & 0x3ffffff;
    }
    return c;
}
// am2 avoids a big mult-and-extract completely.
// Max digit bits should be <= 30 because we do bitwise ops
// on values up to 2*hdvalue^2-hdvalue-1 (< 2^31)
function am2(i, x, w, j, c, n) {
    var xl = x & 0x7fff;
    var xh = x >> 15;
    while (--n >= 0) {
        var l = this[i] & 0x7fff;
        var h = this[i++] >> 15;
        var m = xh * l + h * xl;
        l = xl * l + ((m & 0x7fff) << 15) + w[j] + (c & 0x3fffffff);
        c = (l >>> 30) + (m >>> 15) + xh * h + (c >>> 30);
        w[j++] = l & 0x3fffffff;
    }
    return c;
}
// Alternately, set max digit bits to 28 since some
// browsers slow down when dealing with 32-bit numbers.
function am3(i, x, w, j, c, n) {
    var xl = x & 0x3fff;
    var xh = x >> 14;
    while (--n >= 0) {
        var l = this[i] & 0x3fff;
        var h = this[i++] >> 14;
        var m = xh * l + h * xl;
        l = xl * l + ((m & 0x3fff) << 14) + w[j] + c;
        c = (l >> 28) + (m >> 14) + xh * h;
        w[j++] = l & 0xfffffff;
    }
    return c;
}
if (j_lm && (navigator.appName == "Microsoft Internet Explorer")) {
    BigInteger.prototype.am = am2;
    dbits = 30;
}
else if (j_lm && (navigator.appName != "Netscape")) {
    BigInteger.prototype.am = am1;
    dbits = 26;
}
else { // Mozilla/Netscape seems to prefer am3
    BigInteger.prototype.am = am3;
    dbits = 28;
}
BigInteger.prototype.DB = dbits;
BigInteger.prototype.DM = ((1 << dbits) - 1);
BigInteger.prototype.DV = (1 << dbits);
var BI_FP = 52;
BigInteger.prototype.FV = Math.pow(2, BI_FP);
BigInteger.prototype.F1 = BI_FP - dbits;
BigInteger.prototype.F2 = 2 * dbits - BI_FP;
// Digit conversions
var BI_RC = [];
var rr;
var vv;
rr = "0".charCodeAt(0);
for (vv = 0; vv <= 9; ++vv) {
    BI_RC[rr++] = vv;
}
rr = "a".charCodeAt(0);
for (vv = 10; vv < 36; ++vv) {
    BI_RC[rr++] = vv;
}
rr = "A".charCodeAt(0);
for (vv = 10; vv < 36; ++vv) {
    BI_RC[rr++] = vv;
}
function intAt(s, i) {
    var c = BI_RC[s.charCodeAt(i)];
    return (c == null) ? -1 : c;
}
// return bigint initialized to value
function nbv(i) {
    var r = nbi();
    r.fromInt(i);
    return r;
}
// returns bit length of the integer x
function nbits(x) {
    var r = 1;
    var t;
    if ((t = x >>> 16) != 0) {
        x = t;
        r += 16;
    }
    if ((t = x >> 8) != 0) {
        x = t;
        r += 8;
    }
    if ((t = x >> 4) != 0) {
        x = t;
        r += 4;
    }
    if ((t = x >> 2) != 0) {
        x = t;
        r += 2;
    }
    if ((t = x >> 1) != 0) {
        x = t;
        r += 1;
    }
    return r;
}
// "constants"
BigInteger.ZERO = nbv(0);
BigInteger.ONE = nbv(1);

// prng4.js - uses Arcfour as a PRNG
var Arcfour = /** @class */ (function () {
    function Arcfour() {
        this.i = 0;
        this.j = 0;
        this.S = [];
    }
    // Arcfour.prototype.init = ARC4init;
    // Initialize arcfour context from key, an array of ints, each from [0..255]
    Arcfour.prototype.init = function (key) {
        var i;
        var j;
        var t;
        for (i = 0; i < 256; ++i) {
            this.S[i] = i;
        }
        j = 0;
        for (i = 0; i < 256; ++i) {
            j = (j + this.S[i] + key[i % key.length]) & 255;
            t = this.S[i];
            this.S[i] = this.S[j];
            this.S[j] = t;
        }
        this.i = 0;
        this.j = 0;
    };
    // Arcfour.prototype.next = ARC4next;
    Arcfour.prototype.next = function () {
        var t;
        this.i = (this.i + 1) & 255;
        this.j = (this.j + this.S[this.i]) & 255;
        t = this.S[this.i];
        this.S[this.i] = this.S[this.j];
        this.S[this.j] = t;
        return this.S[(t + this.S[this.i]) & 255];
    };
    return Arcfour;
}());
// Plug in your RNG constructor here
function prng_newstate() {
    return new Arcfour();
}
// Pool size must be a multiple of 4 and greater than 32.
// An array of bytes the size of the pool will be passed to init()
var rng_psize = 256;

// Random number generator - requires a PRNG backend, e.g. prng4.js
var rng_state;
var rng_pool = null;
var rng_pptr;
// Initialize the pool with junk if needed.
if (rng_pool == null) {
    rng_pool = [];
    rng_pptr = 0;
    var t = void 0;
    if (window.crypto && window.crypto.getRandomValues) {
        // Extract entropy (2048 bits) from RNG if available
        var z = new Uint32Array(256);
        window.crypto.getRandomValues(z);
        for (t = 0; t < z.length; ++t) {
            rng_pool[rng_pptr++] = z[t] & 255;
        }
    }
    // Use mouse events for entropy, if we do not have enough entropy by the time
    // we need it, entropy will be generated by Math.random.
    var onMouseMoveListener_1 = function (ev) {
        this.count = this.count || 0;
        if (this.count >= 256 || rng_pptr >= rng_psize) {
            if (window.removeEventListener) {
                window.removeEventListener("mousemove", onMouseMoveListener_1, false);
            }
            else if (window.detachEvent) {
                window.detachEvent("onmousemove", onMouseMoveListener_1);
            }
            return;
        }
        try {
            var mouseCoordinates = ev.x + ev.y;
            rng_pool[rng_pptr++] = mouseCoordinates & 255;
            this.count += 1;
        }
        catch (e) {
            // Sometimes Firefox will deny permission to access event properties for some reason. Ignore.
        }
    };
    if (window.addEventListener) {
        window.addEventListener("mousemove", onMouseMoveListener_1, false);
    }
    else if (window.attachEvent) {
        window.attachEvent("onmousemove", onMouseMoveListener_1);
    }
}
function rng_get_byte() {
    if (rng_state == null) {
        rng_state = prng_newstate();
        // At this point, we may not have collected enough entropy.  If not, fall back to Math.random
        while (rng_pptr < rng_psize) {
            var random = Math.floor(65536 * Math.random());
            rng_pool[rng_pptr++] = random & 255;
        }
        rng_state.init(rng_pool);
        for (rng_pptr = 0; rng_pptr < rng_pool.length; ++rng_pptr) {
            rng_pool[rng_pptr] = 0;
        }
        rng_pptr = 0;
    }
    // TODO: allow reseeding after first request
    return rng_state.next();
}
var SecureRandom = /** @class */ (function () {
    function SecureRandom() {
    }
    SecureRandom.prototype.nextBytes = function (ba) {
        for (var i = 0; i < ba.length; ++i) {
            ba[i] = rng_get_byte();
        }
    };
    return SecureRandom;
}());

// Depends on jsbn.js and rng.js
// function linebrk(s,n) {
//   var ret = "";
//   var i = 0;
//   while(i + n < s.length) {
//     ret += s.substring(i,i+n) + "\n";
//     i += n;
//   }
//   return ret + s.substring(i,s.length);
// }
// function byte2Hex(b) {
//   if(b < 0x10)
//     return "0" + b.toString(16);
//   else
//     return b.toString(16);
// }
function pkcs1pad1(s, n) {
    if (n < s.length + 22) {
        console.error("Message too long for RSA");
        return null;
    }
    var len = n - s.length - 6;
    var filler = "";
    for (var f = 0; f < len; f += 2) {
        filler += "ff";
    }
    var m = "0001" + filler + "00" + s;
    return parseBigInt(m, 16);
}
// PKCS#1 (type 2, random) pad input string s to n bytes, and return a bigint
function pkcs1pad2(s, n) {
    if (n < s.length + 11) { // TODO: fix for utf-8
        console.error("Message too long for RSA");
        return null;
    }
    var ba = [];
    var i = s.length - 1;
    while (i >= 0 && n > 0) {
        var c = s.charCodeAt(i--);
        if (c < 128) { // encode using utf-8
            ba[--n] = c;
        }
        else if ((c > 127) && (c < 2048)) {
            ba[--n] = (c & 63) | 128;
            ba[--n] = (c >> 6) | 192;
        }
        else {
            ba[--n] = (c & 63) | 128;
            ba[--n] = ((c >> 6) & 63) | 128;
            ba[--n] = (c >> 12) | 224;
        }
    }
    ba[--n] = 0;
    var rng = new SecureRandom();
    var x = [];
    while (n > 2) { // random non-zero pad
        x[0] = 0;
        while (x[0] == 0) {
            rng.nextBytes(x);
        }
        ba[--n] = x[0];
    }
    ba[--n] = 2;
    ba[--n] = 0;
    return new BigInteger(ba);
}
// "empty" RSA key constructor
var RSAKey = /** @class */ (function () {
    function RSAKey() {
        this.n = null;
        this.e = 0;
        this.d = null;
        this.p = null;
        this.q = null;
        this.dmp1 = null;
        this.dmq1 = null;
        this.coeff = null;
    }
    //#region PROTECTED
    // protected
    // RSAKey.prototype.doPublic = RSADoPublic;
    // Perform raw public operation on "x": return x^e (mod n)
    RSAKey.prototype.doPublic = function (x) {
        return x.modPowInt(this.e, this.n);
    };
    // RSAKey.prototype.doPrivate = RSADoPrivate;
    // Perform raw private operation on "x": return x^d (mod n)
    RSAKey.prototype.doPrivate = function (x) {
        if (this.p == null || this.q == null) {
            return x.modPow(this.d, this.n);
        }
        // TODO: re-calculate any missing CRT params
        var xp = x.mod(this.p).modPow(this.dmp1, this.p);
        var xq = x.mod(this.q).modPow(this.dmq1, this.q);
        while (xp.compareTo(xq) < 0) {
            xp = xp.add(this.p);
        }
        return xp.subtract(xq).multiply(this.coeff).mod(this.p).multiply(this.q).add(xq);
    };
    //#endregion PROTECTED
    //#region PUBLIC
    // RSAKey.prototype.setPublic = RSASetPublic;
    // Set the public key fields N and e from hex strings
    RSAKey.prototype.setPublic = function (N, E) {
        if (N != null && E != null && N.length > 0 && E.length > 0) {
            this.n = parseBigInt(N, 16);
            this.e = parseInt(E, 16);
        }
        else {
            console.error("Invalid RSA public key");
        }
    };
    // RSAKey.prototype.encrypt = RSAEncrypt;
    // Return the PKCS#1 RSA encryption of "text" as an even-length hex string
    RSAKey.prototype.encrypt = function (text) {
        var m = pkcs1pad2(text, (this.n.bitLength() + 7) >> 3);
        if (m == null) {
            return null;
        }
        var c = this.doPublic(m);
        if (c == null) {
            return null;
        }
        var h = c.toString(16);
        if ((h.length & 1) == 0) {
            return h;
        }
        else {
            return "0" + h;
        }
    };
    // RSAKey.prototype.setPrivate = RSASetPrivate;
    // Set the private key fields N, e, and d from hex strings
    RSAKey.prototype.setPrivate = function (N, E, D) {
        if (N != null && E != null && N.length > 0 && E.length > 0) {
            this.n = parseBigInt(N, 16);
            this.e = parseInt(E, 16);
            this.d = parseBigInt(D, 16);
        }
        else {
            console.error("Invalid RSA private key");
        }
    };
    // RSAKey.prototype.setPrivateEx = RSASetPrivateEx;
    // Set the private key fields N, e, d and CRT params from hex strings
    RSAKey.prototype.setPrivateEx = function (N, E, D, P, Q, DP, DQ, C) {
        if (N != null && E != null && N.length > 0 && E.length > 0) {
            this.n = parseBigInt(N, 16);
            this.e = parseInt(E, 16);
            this.d = parseBigInt(D, 16);
            this.p = parseBigInt(P, 16);
            this.q = parseBigInt(Q, 16);
            this.dmp1 = parseBigInt(DP, 16);
            this.dmq1 = parseBigInt(DQ, 16);
            this.coeff = parseBigInt(C, 16);
        }
        else {
            console.error("Invalid RSA private key");
        }
    };
    // RSAKey.prototype.generate = RSAGenerate;
    // Generate a new random private key B bits long, using public expt E
    RSAKey.prototype.generate = function (B, E) {
        var rng = new SecureRandom();
        var qs = B >> 1;
        this.e = parseInt(E, 16);
        var ee = new BigInteger(E, 16);
        for (;;) {
            for (;;) {
                this.p = new BigInteger(B - qs, 1, rng);
                if (this.p.subtract(BigInteger.ONE).gcd(ee).compareTo(BigInteger.ONE) == 0 && this.p.isProbablePrime(10)) {
                    break;
                }
            }
            for (;;) {
                this.q = new BigInteger(qs, 1, rng);
                if (this.q.subtract(BigInteger.ONE).gcd(ee).compareTo(BigInteger.ONE) == 0 && this.q.isProbablePrime(10)) {
                    break;
                }
            }
            if (this.p.compareTo(this.q) <= 0) {
                var t = this.p;
                this.p = this.q;
                this.q = t;
            }
            var p1 = this.p.subtract(BigInteger.ONE);
            var q1 = this.q.subtract(BigInteger.ONE);
            var phi = p1.multiply(q1);
            if (phi.gcd(ee).compareTo(BigInteger.ONE) == 0) {
                this.n = this.p.multiply(this.q);
                this.d = ee.modInverse(phi);
                this.dmp1 = this.d.mod(p1);
                this.dmq1 = this.d.mod(q1);
                this.coeff = this.q.modInverse(this.p);
                break;
            }
        }
    };
    // RSAKey.prototype.decrypt = RSADecrypt;
    // Return the PKCS#1 RSA decryption of "ctext".
    // "ctext" is an even-length hex string and the output is a plain string.
    RSAKey.prototype.decrypt = function (ctext) {
        var c = parseBigInt(ctext, 16);
        var m = this.doPrivate(c);
        if (m == null) {
            return null;
        }
        return pkcs1unpad2(m, (this.n.bitLength() + 7) >> 3);
    };
    // Generate a new random private key B bits long, using public expt E
    RSAKey.prototype.generateAsync = function (B, E, callback) {
        var rng = new SecureRandom();
        var qs = B >> 1;
        this.e = parseInt(E, 16);
        var ee = new BigInteger(E, 16);
        var rsa = this;
        // These functions have non-descript names because they were originally for(;;) loops.
        // I don't know about cryptography to give them better names than loop1-4.
        var loop1 = function () {
            var loop4 = function () {
                if (rsa.p.compareTo(rsa.q) <= 0) {
                    var t = rsa.p;
                    rsa.p = rsa.q;
                    rsa.q = t;
                }
                var p1 = rsa.p.subtract(BigInteger.ONE);
                var q1 = rsa.q.subtract(BigInteger.ONE);
                var phi = p1.multiply(q1);
                if (phi.gcd(ee).compareTo(BigInteger.ONE) == 0) {
                    rsa.n = rsa.p.multiply(rsa.q);
                    rsa.d = ee.modInverse(phi);
                    rsa.dmp1 = rsa.d.mod(p1);
                    rsa.dmq1 = rsa.d.mod(q1);
                    rsa.coeff = rsa.q.modInverse(rsa.p);
                    setTimeout(function () { callback(); }, 0); // escape
                }
                else {
                    setTimeout(loop1, 0);
                }
            };
            var loop3 = function () {
                rsa.q = nbi();
                rsa.q.fromNumberAsync(qs, 1, rng, function () {
                    rsa.q.subtract(BigInteger.ONE).gcda(ee, function (r) {
                        if (r.compareTo(BigInteger.ONE) == 0 && rsa.q.isProbablePrime(10)) {
                            setTimeout(loop4, 0);
                        }
                        else {
                            setTimeout(loop3, 0);
                        }
                    });
                });
            };
            var loop2 = function () {
                rsa.p = nbi();
                rsa.p.fromNumberAsync(B - qs, 1, rng, function () {
                    rsa.p.subtract(BigInteger.ONE).gcda(ee, function (r) {
                        if (r.compareTo(BigInteger.ONE) == 0 && rsa.p.isProbablePrime(10)) {
                            setTimeout(loop3, 0);
                        }
                        else {
                            setTimeout(loop2, 0);
                        }
                    });
                });
            };
            setTimeout(loop2, 0);
        };
        setTimeout(loop1, 0);
    };
    RSAKey.prototype.sign = function (text, digestMethod, digestName) {
        var header = getDigestHeader(digestName);
        var digest = header + digestMethod(text).toString();
        var m = pkcs1pad1(digest, this.n.bitLength() / 4);
        if (m == null) {
            return null;
        }
        var c = this.doPrivate(m);
        if (c == null) {
            return null;
        }
        var h = c.toString(16);
        if ((h.length & 1) == 0) {
            return h;
        }
        else {
            return "0" + h;
        }
    };
    RSAKey.prototype.verify = function (text, signature, digestMethod) {
        var c = parseBigInt(signature, 16);
        var m = this.doPublic(c);
        if (m == null) {
            return null;
        }
        var unpadded = m.toString(16).replace(/^1f+00/, "");
        var digest = removeDigestHeader(unpadded);
        return digest == digestMethod(text).toString();
    };
    return RSAKey;
}());
// Undo PKCS#1 (type 2, random) padding and, if valid, return the plaintext
function pkcs1unpad2(d, n) {
    var b = d.toByteArray();
    var i = 0;
    while (i < b.length && b[i] == 0) {
        ++i;
    }
    if (b.length - i != n - 1 || b[i] != 2) {
        return null;
    }
    ++i;
    while (b[i] != 0) {
        if (++i >= b.length) {
            return null;
        }
    }
    var ret = "";
    while (++i < b.length) {
        var c = b[i] & 255;
        if (c < 128) { // utf-8 decode
            ret += String.fromCharCode(c);
        }
        else if ((c > 191) && (c < 224)) {
            ret += String.fromCharCode(((c & 31) << 6) | (b[i + 1] & 63));
            ++i;
        }
        else {
            ret += String.fromCharCode(((c & 15) << 12) | ((b[i + 1] & 63) << 6) | (b[i + 2] & 63));
            i += 2;
        }
    }
    return ret;
}
// https://tools.ietf.org/html/rfc3447#page-43
var DIGEST_HEADERS = {
    md2: "3020300c06082a864886f70d020205000410",
    md5: "3020300c06082a864886f70d020505000410",
    sha1: "3021300906052b0e03021a05000414",
    sha224: "302d300d06096086480165030402040500041c",
    sha256: "3031300d060960864801650304020105000420",
    sha384: "3041300d060960864801650304020205000430",
    sha512: "3051300d060960864801650304020305000440",
    ripemd160: "3021300906052b2403020105000414"};

function getDigestHeader(name) {
    return DIGEST_HEADERS[name] || "";
}
function removeDigestHeader(str) {
    for (var name_1 in DIGEST_HEADERS) {
        if (DIGEST_HEADERS.hasOwnProperty(name_1)) {
            var header = DIGEST_HEADERS[name_1];
            var len = header.length;
            if (str.substr(0, len) == header) {
                return str.substr(len);
            }
        }
    }
    return str;
}
// Return the PKCS#1 RSA encryption of "text" as a Base64-encoded string
// function RSAEncryptB64(text) {
//  var h = this.encrypt(text);
//  if(h) return hex2b64(h); else return null;
// }
// public
// RSAKey.prototype.encrypt_b64 = RSAEncryptB64;

/*!
Copyright (c) 2011, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.com/yui/license.html
version: 2.9.0
*/
var YAHOO = {};
YAHOO.lang = {
    /**
     * Utility to set up the prototype, constructor and superclass properties to
     * support an inheritance strategy that can chain constructors and methods.
     * Static members will not be inherited.
     *
     * @method extend
     * @static
     * @param {Function} subc   the object to modify
     * @param {Function} superc the object to inherit
     * @param {Object} overrides  additional properties/methods to add to the
     *                              subclass prototype.  These will override the
     *                              matching items obtained from the superclass
     *                              if present.
     */
    extend: function(subc, superc, overrides) {
        if (! superc || ! subc) {
            throw new Error("YAHOO.lang.extend failed, please check that " +
                "all dependencies are included.");
        }

        var F = function() {};
        F.prototype = superc.prototype;
        subc.prototype = new F();
        subc.prototype.constructor = subc;
        subc.superclass = superc.prototype;

        if (superc.prototype.constructor == Object.prototype.constructor) {
            superc.prototype.constructor = superc;
        }

        if (overrides) {
            var i;
            for (i in overrides) {
                subc.prototype[i] = overrides[i];
            }

            /*
             * IE will not enumerate native functions in a derived object even if the
             * function was overridden.  This is a workaround for specific functions
             * we care about on the Object prototype.
             * @property _IEEnumFix
             * @param {Function} r  the object to receive the augmentation
             * @param {Function} s  the object that supplies the properties to augment
             * @static
             * @private
             */
            var _IEEnumFix = function() {},
                ADD = ["toString", "valueOf"];
            try {
                if (/MSIE/.test(navigator.userAgent)) {
                    _IEEnumFix = function(r, s) {
                        for (i = 0; i < ADD.length; i = i + 1) {
                            var fname = ADD[i], f = s[fname];
                            if (typeof f === 'function' && f != Object.prototype[fname]) {
                                r[fname] = f;
                            }
                        }
                    };
                }
            } catch (ex) {}            _IEEnumFix(subc.prototype, overrides);
        }
    }
};

/* asn1-1.0.13.js (c) 2013-2017 Kenji Urushima | kjur.github.com/jsrsasign/license
 */

/**
 * @fileOverview
 * @name asn1-1.0.js
 * @author Kenji Urushima kenji.urushima@gmail.com
 * @version asn1 1.0.13 (2017-Jun-02)
 * @since jsrsasign 2.1
 * @license <a href="https://kjur.github.io/jsrsasign/license/">MIT License</a>
 */

/**
 * kjur's class library name space
 * <p>
 * This name space provides following name spaces:
 * <ul>
 * <li>{@link KJUR.asn1} - ASN.1 primitive hexadecimal encoder</li>
 * <li>{@link KJUR.asn1.x509} - ASN.1 structure for X.509 certificate and CRL</li>
 * <li>{@link KJUR.crypto} - Java Cryptographic Extension(JCE) style MessageDigest/Signature
 * class and utilities</li>
 * </ul>
 * </p>
 * NOTE: Please ignore method summary and document of this namespace. This caused by a bug of jsdoc2.
 * @name KJUR
 * @namespace kjur's class library name space
 */
var KJUR = {};

/**
 * kjur's ASN.1 class library name space
 * <p>
 * This is ITU-T X.690 ASN.1 DER encoder class library and
 * class structure and methods is very similar to
 * org.bouncycastle.asn1 package of
 * well known BouncyCaslte Cryptography Library.
 * <h4>PROVIDING ASN.1 PRIMITIVES</h4>
 * Here are ASN.1 DER primitive classes.
 * <ul>
 * <li>0x01 {@link KJUR.asn1.DERBoolean}</li>
 * <li>0x02 {@link KJUR.asn1.DERInteger}</li>
 * <li>0x03 {@link KJUR.asn1.DERBitString}</li>
 * <li>0x04 {@link KJUR.asn1.DEROctetString}</li>
 * <li>0x05 {@link KJUR.asn1.DERNull}</li>
 * <li>0x06 {@link KJUR.asn1.DERObjectIdentifier}</li>
 * <li>0x0a {@link KJUR.asn1.DEREnumerated}</li>
 * <li>0x0c {@link KJUR.asn1.DERUTF8String}</li>
 * <li>0x12 {@link KJUR.asn1.DERNumericString}</li>
 * <li>0x13 {@link KJUR.asn1.DERPrintableString}</li>
 * <li>0x14 {@link KJUR.asn1.DERTeletexString}</li>
 * <li>0x16 {@link KJUR.asn1.DERIA5String}</li>
 * <li>0x17 {@link KJUR.asn1.DERUTCTime}</li>
 * <li>0x18 {@link KJUR.asn1.DERGeneralizedTime}</li>
 * <li>0x30 {@link KJUR.asn1.DERSequence}</li>
 * <li>0x31 {@link KJUR.asn1.DERSet}</li>
 * </ul>
 * <h4>OTHER ASN.1 CLASSES</h4>
 * <ul>
 * <li>{@link KJUR.asn1.ASN1Object}</li>
 * <li>{@link KJUR.asn1.DERAbstractString}</li>
 * <li>{@link KJUR.asn1.DERAbstractTime}</li>
 * <li>{@link KJUR.asn1.DERAbstractStructured}</li>
 * <li>{@link KJUR.asn1.DERTaggedObject}</li>
 * </ul>
 * <h4>SUB NAME SPACES</h4>
 * <ul>
 * <li>{@link KJUR.asn1.cades} - CAdES long term signature format</li>
 * <li>{@link KJUR.asn1.cms} - Cryptographic Message Syntax</li>
 * <li>{@link KJUR.asn1.csr} - Certificate Signing Request (CSR/PKCS#10)</li>
 * <li>{@link KJUR.asn1.tsp} - RFC 3161 Timestamping Protocol Format</li>
 * <li>{@link KJUR.asn1.x509} - RFC 5280 X.509 certificate and CRL</li>
 * </ul>
 * </p>
 * NOTE: Please ignore method summary and document of this namespace.
 * This caused by a bug of jsdoc2.
 * @name KJUR.asn1
 * @namespace
 */
if (typeof KJUR.asn1 == "undefined" || !KJUR.asn1) KJUR.asn1 = {};

/**
 * ASN1 utilities class
 * @name KJUR.asn1.ASN1Util
 * @class ASN1 utilities class
 * @since asn1 1.0.2
 */
KJUR.asn1.ASN1Util = new function() {
    this.integerToByteHex = function(i) {
        var h = i.toString(16);
        if ((h.length % 2) == 1) h = '0' + h;
        return h;
    };
    this.bigIntToMinTwosComplementsHex = function(bigIntegerValue) {
        var h = bigIntegerValue.toString(16);
        if (h.substr(0, 1) != '-') {
            if (h.length % 2 == 1) {
                h = '0' + h;
            } else {
                if (! h.match(/^[0-7]/)) {
                    h = '00' + h;
                }
            }
        } else {
            var hPos = h.substr(1);
            var xorLen = hPos.length;
            if (xorLen % 2 == 1) {
                xorLen += 1;
            } else {
                if (! h.match(/^[0-7]/)) {
                    xorLen += 2;
                }
            }
            var hMask = '';
            for (var i = 0; i < xorLen; i++) {
                hMask += 'f';
            }
            var biMask = new BigInteger(hMask, 16);
            var biNeg = biMask.xor(bigIntegerValue).add(BigInteger.ONE);
            h = biNeg.toString(16).replace(/^-/, '');
        }
        return h;
    };
    /**
     * get PEM string from hexadecimal data and header string
     * @name getPEMStringFromHex
     * @memberOf KJUR.asn1.ASN1Util
     * @function
     * @param {String} dataHex hexadecimal string of PEM body
     * @param {String} pemHeader PEM header string (ex. 'RSA PRIVATE KEY')
     * @return {String} PEM formatted string of input data
     * @description
     * This method converts a hexadecimal string to a PEM string with
     * a specified header. Its line break will be CRLF("\r\n").
     * @example
     * var pem  = KJUR.asn1.ASN1Util.getPEMStringFromHex('616161', 'RSA PRIVATE KEY');
     * // value of pem will be:
     * -----BEGIN PRIVATE KEY-----
     * YWFh
     * -----END PRIVATE KEY-----
     */
    this.getPEMStringFromHex = function(dataHex, pemHeader) {
        return hextopem(dataHex, pemHeader);
    };

    /**
     * generate ASN1Object specifed by JSON parameters
     * @name newObject
     * @memberOf KJUR.asn1.ASN1Util
     * @function
     * @param {Array} param JSON parameter to generate ASN1Object
     * @return {KJUR.asn1.ASN1Object} generated object
     * @since asn1 1.0.3
     * @description
     * generate any ASN1Object specified by JSON param
     * including ASN.1 primitive or structured.
     * Generally 'param' can be described as follows:
     * <blockquote>
     * {TYPE-OF-ASNOBJ: ASN1OBJ-PARAMETER}
     * </blockquote>
     * 'TYPE-OF-ASN1OBJ' can be one of following symbols:
     * <ul>
     * <li>'bool' - DERBoolean</li>
     * <li>'int' - DERInteger</li>
     * <li>'bitstr' - DERBitString</li>
     * <li>'octstr' - DEROctetString</li>
     * <li>'null' - DERNull</li>
     * <li>'oid' - DERObjectIdentifier</li>
     * <li>'enum' - DEREnumerated</li>
     * <li>'utf8str' - DERUTF8String</li>
     * <li>'numstr' - DERNumericString</li>
     * <li>'prnstr' - DERPrintableString</li>
     * <li>'telstr' - DERTeletexString</li>
     * <li>'ia5str' - DERIA5String</li>
     * <li>'utctime' - DERUTCTime</li>
     * <li>'gentime' - DERGeneralizedTime</li>
     * <li>'seq' - DERSequence</li>
     * <li>'set' - DERSet</li>
     * <li>'tag' - DERTaggedObject</li>
     * </ul>
     * @example
     * newObject({'prnstr': 'aaa'});
     * newObject({'seq': [{'int': 3}, {'prnstr': 'aaa'}]})
     * // ASN.1 Tagged Object
     * newObject({'tag': {'tag': 'a1',
     *                    'explicit': true,
     *                    'obj': {'seq': [{'int': 3}, {'prnstr': 'aaa'}]}}});
     * // more simple representation of ASN.1 Tagged Object
     * newObject({'tag': ['a1',
     *                    true,
     *                    {'seq': [
     *                      {'int': 3},
     *                      {'prnstr': 'aaa'}]}
     *                   ]});
     */
    this.newObject = function(param) {
        var _KJUR = KJUR,
            _KJUR_asn1 = _KJUR.asn1,
            _DERBoolean = _KJUR_asn1.DERBoolean,
            _DERInteger = _KJUR_asn1.DERInteger,
            _DERBitString = _KJUR_asn1.DERBitString,
            _DEROctetString = _KJUR_asn1.DEROctetString,
            _DERNull = _KJUR_asn1.DERNull,
            _DERObjectIdentifier = _KJUR_asn1.DERObjectIdentifier,
            _DEREnumerated = _KJUR_asn1.DEREnumerated,
            _DERUTF8String = _KJUR_asn1.DERUTF8String,
            _DERNumericString = _KJUR_asn1.DERNumericString,
            _DERPrintableString = _KJUR_asn1.DERPrintableString,
            _DERTeletexString = _KJUR_asn1.DERTeletexString,
            _DERIA5String = _KJUR_asn1.DERIA5String,
            _DERUTCTime = _KJUR_asn1.DERUTCTime,
            _DERGeneralizedTime = _KJUR_asn1.DERGeneralizedTime,
            _DERSequence = _KJUR_asn1.DERSequence,
            _DERSet = _KJUR_asn1.DERSet,
            _DERTaggedObject = _KJUR_asn1.DERTaggedObject,
            _newObject = _KJUR_asn1.ASN1Util.newObject;

        var keys = Object.keys(param);
        if (keys.length != 1)
            throw "key of param shall be only one.";
        var key = keys[0];

        if (":bool:int:bitstr:octstr:null:oid:enum:utf8str:numstr:prnstr:telstr:ia5str:utctime:gentime:seq:set:tag:".indexOf(":" + key + ":") == -1)
            throw "undefined key: " + key;

        if (key == "bool")    return new _DERBoolean(param[key]);
        if (key == "int")     return new _DERInteger(param[key]);
        if (key == "bitstr")  return new _DERBitString(param[key]);
        if (key == "octstr")  return new _DEROctetString(param[key]);
        if (key == "null")    return new _DERNull(param[key]);
        if (key == "oid")     return new _DERObjectIdentifier(param[key]);
        if (key == "enum")    return new _DEREnumerated(param[key]);
        if (key == "utf8str") return new _DERUTF8String(param[key]);
        if (key == "numstr")  return new _DERNumericString(param[key]);
        if (key == "prnstr")  return new _DERPrintableString(param[key]);
        if (key == "telstr")  return new _DERTeletexString(param[key]);
        if (key == "ia5str")  return new _DERIA5String(param[key]);
        if (key == "utctime") return new _DERUTCTime(param[key]);
        if (key == "gentime") return new _DERGeneralizedTime(param[key]);

        if (key == "seq") {
            var paramList = param[key];
            var a = [];
            for (var i = 0; i < paramList.length; i++) {
                var asn1Obj = _newObject(paramList[i]);
                a.push(asn1Obj);
            }
            return new _DERSequence({'array': a});
        }

        if (key == "set") {
            var paramList = param[key];
            var a = [];
            for (var i = 0; i < paramList.length; i++) {
                var asn1Obj = _newObject(paramList[i]);
                a.push(asn1Obj);
            }
            return new _DERSet({'array': a});
        }

        if (key == "tag") {
            var tagParam = param[key];
            if (Object.prototype.toString.call(tagParam) === '[object Array]' &&
                tagParam.length == 3) {
                var obj = _newObject(tagParam[2]);
                return new _DERTaggedObject({tag: tagParam[0],
                    explicit: tagParam[1],
                    obj: obj});
            } else {
                var newParam = {};
                if (tagParam.explicit !== undefined)
                    newParam.explicit = tagParam.explicit;
                if (tagParam.tag !== undefined)
                    newParam.tag = tagParam.tag;
                if (tagParam.obj === undefined)
                    throw "obj shall be specified for 'tag'.";
                newParam.obj = _newObject(tagParam.obj);
                return new _DERTaggedObject(newParam);
            }
        }
    };

    /**
     * get encoded hexadecimal string of ASN1Object specifed by JSON parameters
     * @name jsonToASN1HEX
     * @memberOf KJUR.asn1.ASN1Util
     * @function
     * @param {Array} param JSON parameter to generate ASN1Object
     * @return hexadecimal string of ASN1Object
     * @since asn1 1.0.4
     * @description
     * As for ASN.1 object representation of JSON object,
     * please see {@link newObject}.
     * @example
     * jsonToASN1HEX({'prnstr': 'aaa'});
     */
    this.jsonToASN1HEX = function(param) {
        var asn1Obj = this.newObject(param);
        return asn1Obj.getEncodedHex();
    };
};

/**
 * get dot noted oid number string from hexadecimal value of OID
 * @name oidHexToInt
 * @memberOf KJUR.asn1.ASN1Util
 * @function
 * @param {String} hex hexadecimal value of object identifier
 * @return {String} dot noted string of object identifier
 * @since jsrsasign 4.8.3 asn1 1.0.7
 * @description
 * This static method converts from hexadecimal string representation of
 * ASN.1 value of object identifier to oid number string.
 * @example
 * KJUR.asn1.ASN1Util.oidHexToInt('550406') &rarr; "2.5.4.6"
 */
KJUR.asn1.ASN1Util.oidHexToInt = function(hex) {
    var s = "";
    var i01 = parseInt(hex.substr(0, 2), 16);
    var i0 = Math.floor(i01 / 40);
    var i1 = i01 % 40;
    var s = i0 + "." + i1;

    var binbuf = "";
    for (var i = 2; i < hex.length; i += 2) {
        var value = parseInt(hex.substr(i, 2), 16);
        var bin = ("00000000" + value.toString(2)).slice(- 8);
        binbuf = binbuf + bin.substr(1, 7);
        if (bin.substr(0, 1) == "0") {
            var bi = new BigInteger(binbuf, 2);
            s = s + "." + bi.toString(10);
            binbuf = "";
        }
    }
    return s;
};

/**
 * get hexadecimal value of object identifier from dot noted oid value
 * @name oidIntToHex
 * @memberOf KJUR.asn1.ASN1Util
 * @function
 * @param {String} oidString dot noted string of object identifier
 * @return {String} hexadecimal value of object identifier
 * @since jsrsasign 4.8.3 asn1 1.0.7
 * @description
 * This static method converts from object identifier value string.
 * to hexadecimal string representation of it.
 * @example
 * KJUR.asn1.ASN1Util.oidIntToHex("2.5.4.6") &rarr; "550406"
 */
KJUR.asn1.ASN1Util.oidIntToHex = function(oidString) {
    var itox = function(i) {
        var h = i.toString(16);
        if (h.length == 1) h = '0' + h;
        return h;
    };

    var roidtox = function(roid) {
        var h = '';
        var bi = new BigInteger(roid, 10);
        var b = bi.toString(2);
        var padLen = 7 - b.length % 7;
        if (padLen == 7) padLen = 0;
        var bPad = '';
        for (var i = 0; i < padLen; i++) bPad += '0';
        b = bPad + b;
        for (var i = 0; i < b.length - 1; i += 7) {
            var b8 = b.substr(i, 7);
            if (i != b.length - 7) b8 = '1' + b8;
            h += itox(parseInt(b8, 2));
        }
        return h;
    };

    if (! oidString.match(/^[0-9.]+$/)) {
        throw "malformed oid string: " + oidString;
    }
    var h = '';
    var a = oidString.split('.');
    var i0 = parseInt(a[0]) * 40 + parseInt(a[1]);
    h += itox(i0);
    a.splice(0, 2);
    for (var i = 0; i < a.length; i++) {
        h += roidtox(a[i]);
    }
    return h;
};


// ********************************************************************
//  Abstract ASN.1 Classes
// ********************************************************************

// ********************************************************************

/**
 * base class for ASN.1 DER encoder object
 * @name KJUR.asn1.ASN1Object
 * @class base class for ASN.1 DER encoder object
 * @property {Boolean} isModified flag whether internal data was changed
 * @property {String} hTLV hexadecimal string of ASN.1 TLV
 * @property {String} hT hexadecimal string of ASN.1 TLV tag(T)
 * @property {String} hL hexadecimal string of ASN.1 TLV length(L)
 * @property {String} hV hexadecimal string of ASN.1 TLV value(V)
 * @description
 */
KJUR.asn1.ASN1Object = function() {
    var hV = '';

    /**
     * get hexadecimal ASN.1 TLV length(L) bytes from TLV value(V)
     * @name getLengthHexFromValue
     * @memberOf KJUR.asn1.ASN1Object#
     * @function
     * @return {String} hexadecimal string of ASN.1 TLV length(L)
     */
    this.getLengthHexFromValue = function() {
        if (typeof this.hV == "undefined" || this.hV == null) {
            throw "this.hV is null or undefined.";
        }
        if (this.hV.length % 2 == 1) {
            throw "value hex must be even length: n=" + hV.length + ",v=" + this.hV;
        }
        var n = this.hV.length / 2;
        var hN = n.toString(16);
        if (hN.length % 2 == 1) {
            hN = "0" + hN;
        }
        if (n < 128) {
            return hN;
        } else {
            var hNlen = hN.length / 2;
            if (hNlen > 15) {
                throw "ASN.1 length too long to represent by 8x: n = " + n.toString(16);
            }
            var head = 128 + hNlen;
            return head.toString(16) + hN;
        }
    };

    /**
     * get hexadecimal string of ASN.1 TLV bytes
     * @name getEncodedHex
     * @memberOf KJUR.asn1.ASN1Object#
     * @function
     * @return {String} hexadecimal string of ASN.1 TLV
     */
    this.getEncodedHex = function() {
        if (this.hTLV == null || this.isModified) {
            this.hV = this.getFreshValueHex();
            this.hL = this.getLengthHexFromValue();
            this.hTLV = this.hT + this.hL + this.hV;
            this.isModified = false;
            //alert("first time: " + this.hTLV);
        }
        return this.hTLV;
    };

    /**
     * get hexadecimal string of ASN.1 TLV value(V) bytes
     * @name getValueHex
     * @memberOf KJUR.asn1.ASN1Object#
     * @function
     * @return {String} hexadecimal string of ASN.1 TLV value(V) bytes
     */
    this.getValueHex = function() {
        this.getEncodedHex();
        return this.hV;
    };

    this.getFreshValueHex = function() {
        return '';
    };
};

// == BEGIN DERAbstractString ================================================
/**
 * base class for ASN.1 DER string classes
 * @name KJUR.asn1.DERAbstractString
 * @class base class for ASN.1 DER string classes
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @property {String} s internal string of value
 * @extends KJUR.asn1.ASN1Object
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>str - specify initial ASN.1 value(V) by a string</li>
 * <li>hex - specify initial ASN.1 value(V) by a hexadecimal string</li>
 * </ul>
 * NOTE: 'params' can be omitted.
 */
KJUR.asn1.DERAbstractString = function(params) {
    KJUR.asn1.DERAbstractString.superclass.constructor.call(this);

    /**
     * get string value of this string object
     * @name getString
     * @memberOf KJUR.asn1.DERAbstractString#
     * @function
     * @return {String} string value of this string object
     */
    this.getString = function() {
        return this.s;
    };

    /**
     * set value by a string
     * @name setString
     * @memberOf KJUR.asn1.DERAbstractString#
     * @function
     * @param {String} newS value by a string to set
     */
    this.setString = function(newS) {
        this.hTLV = null;
        this.isModified = true;
        this.s = newS;
        this.hV = stohex(this.s);
    };

    /**
     * set value by a hexadecimal string
     * @name setStringHex
     * @memberOf KJUR.asn1.DERAbstractString#
     * @function
     * @param {String} newHexString value by a hexadecimal string to set
     */
    this.setStringHex = function(newHexString) {
        this.hTLV = null;
        this.isModified = true;
        this.s = null;
        this.hV = newHexString;
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };

    if (typeof params != "undefined") {
        if (typeof params == "string") {
            this.setString(params);
        } else if (typeof params['str'] != "undefined") {
            this.setString(params['str']);
        } else if (typeof params['hex'] != "undefined") {
            this.setStringHex(params['hex']);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERAbstractString, KJUR.asn1.ASN1Object);
// == END   DERAbstractString ================================================

// == BEGIN DERAbstractTime ==================================================
/**
 * base class for ASN.1 DER Generalized/UTCTime class
 * @name KJUR.asn1.DERAbstractTime
 * @class base class for ASN.1 DER Generalized/UTCTime class
 * @param {Array} params associative array of parameters (ex. {'str': '130430235959Z'})
 * @extends KJUR.asn1.ASN1Object
 * @description
 * @see KJUR.asn1.ASN1Object - superclass
 */
KJUR.asn1.DERAbstractTime = function(params) {
    KJUR.asn1.DERAbstractTime.superclass.constructor.call(this);

    // --- PRIVATE METHODS --------------------
    this.localDateToUTC = function(d) {
        utc = d.getTime() + (d.getTimezoneOffset() * 60000);
        var utcDate = new Date(utc);
        return utcDate;
    };

    /*
     * format date string by Data object
     * @name formatDate
     * @memberOf KJUR.asn1.AbstractTime;
     * @param {Date} dateObject
     * @param {string} type 'utc' or 'gen'
     * @param {boolean} withMillis flag for with millisections or not
     * @description
     * 'withMillis' flag is supported from asn1 1.0.6.
     */
    this.formatDate = function(dateObject, type, withMillis) {
        var pad = this.zeroPadding;
        var d = this.localDateToUTC(dateObject);
        var year = String(d.getFullYear());
        if (type == 'utc') year = year.substr(2, 2);
        var month = pad(String(d.getMonth() + 1), 2);
        var day = pad(String(d.getDate()), 2);
        var hour = pad(String(d.getHours()), 2);
        var min = pad(String(d.getMinutes()), 2);
        var sec = pad(String(d.getSeconds()), 2);
        var s = year + month + day + hour + min + sec;
        if (withMillis === true) {
            var millis = d.getMilliseconds();
            if (millis != 0) {
                var sMillis = pad(String(millis), 3);
                sMillis = sMillis.replace(/[0]+$/, "");
                s = s + "." + sMillis;
            }
        }
        return s + "Z";
    };

    this.zeroPadding = function(s, len) {
        if (s.length >= len) return s;
        return new Array(len - s.length + 1).join('0') + s;
    };

    // --- PUBLIC METHODS --------------------
    /**
     * get string value of this string object
     * @name getString
     * @memberOf KJUR.asn1.DERAbstractTime#
     * @function
     * @return {String} string value of this time object
     */
    this.getString = function() {
        return this.s;
    };

    /**
     * set value by a string
     * @name setString
     * @memberOf KJUR.asn1.DERAbstractTime#
     * @function
     * @param {String} newS value by a string to set such like "130430235959Z"
     */
    this.setString = function(newS) {
        this.hTLV = null;
        this.isModified = true;
        this.s = newS;
        this.hV = stohex(newS);
    };

    /**
     * set value by a Date object
     * @name setByDateValue
     * @memberOf KJUR.asn1.DERAbstractTime#
     * @function
     * @param {Integer} year year of date (ex. 2013)
     * @param {Integer} month month of date between 1 and 12 (ex. 12)
     * @param {Integer} day day of month
     * @param {Integer} hour hours of date
     * @param {Integer} min minutes of date
     * @param {Integer} sec seconds of date
     */
    this.setByDateValue = function(year, month, day, hour, min, sec) {
        var dateObject = new Date(Date.UTC(year, month - 1, day, hour, min, sec, 0));
        this.setByDate(dateObject);
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };
};
YAHOO.lang.extend(KJUR.asn1.DERAbstractTime, KJUR.asn1.ASN1Object);
// == END   DERAbstractTime ==================================================

// == BEGIN DERAbstractStructured ============================================
/**
 * base class for ASN.1 DER structured class
 * @name KJUR.asn1.DERAbstractStructured
 * @class base class for ASN.1 DER structured class
 * @property {Array} asn1Array internal array of ASN1Object
 * @extends KJUR.asn1.ASN1Object
 * @description
 * @see KJUR.asn1.ASN1Object - superclass
 */
KJUR.asn1.DERAbstractStructured = function(params) {
    KJUR.asn1.DERAbstractString.superclass.constructor.call(this);

    /**
     * set value by array of ASN1Object
     * @name setByASN1ObjectArray
     * @memberOf KJUR.asn1.DERAbstractStructured#
     * @function
     * @param {array} asn1ObjectArray array of ASN1Object to set
     */
    this.setByASN1ObjectArray = function(asn1ObjectArray) {
        this.hTLV = null;
        this.isModified = true;
        this.asn1Array = asn1ObjectArray;
    };

    /**
     * append an ASN1Object to internal array
     * @name appendASN1Object
     * @memberOf KJUR.asn1.DERAbstractStructured#
     * @function
     * @param {ASN1Object} asn1Object to add
     */
    this.appendASN1Object = function(asn1Object) {
        this.hTLV = null;
        this.isModified = true;
        this.asn1Array.push(asn1Object);
    };

    this.asn1Array = new Array();
    if (typeof params != "undefined") {
        if (typeof params['array'] != "undefined") {
            this.asn1Array = params['array'];
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERAbstractStructured, KJUR.asn1.ASN1Object);


// ********************************************************************
//  ASN.1 Object Classes
// ********************************************************************

// ********************************************************************
/**
 * class for ASN.1 DER Boolean
 * @name KJUR.asn1.DERBoolean
 * @class class for ASN.1 DER Boolean
 * @extends KJUR.asn1.ASN1Object
 * @description
 * @see KJUR.asn1.ASN1Object - superclass
 */
KJUR.asn1.DERBoolean = function() {
    KJUR.asn1.DERBoolean.superclass.constructor.call(this);
    this.hT = "01";
    this.hTLV = "0101ff";
};
YAHOO.lang.extend(KJUR.asn1.DERBoolean, KJUR.asn1.ASN1Object);

// ********************************************************************
/**
 * class for ASN.1 DER Integer
 * @name KJUR.asn1.DERInteger
 * @class class for ASN.1 DER Integer
 * @extends KJUR.asn1.ASN1Object
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>int - specify initial ASN.1 value(V) by integer value</li>
 * <li>bigint - specify initial ASN.1 value(V) by BigInteger object</li>
 * <li>hex - specify initial ASN.1 value(V) by a hexadecimal string</li>
 * </ul>
 * NOTE: 'params' can be omitted.
 */
KJUR.asn1.DERInteger = function(params) {
    KJUR.asn1.DERInteger.superclass.constructor.call(this);
    this.hT = "02";

    /**
     * set value by Tom Wu's BigInteger object
     * @name setByBigInteger
     * @memberOf KJUR.asn1.DERInteger#
     * @function
     * @param {BigInteger} bigIntegerValue to set
     */
    this.setByBigInteger = function(bigIntegerValue) {
        this.hTLV = null;
        this.isModified = true;
        this.hV = KJUR.asn1.ASN1Util.bigIntToMinTwosComplementsHex(bigIntegerValue);
    };

    /**
     * set value by integer value
     * @name setByInteger
     * @memberOf KJUR.asn1.DERInteger
     * @function
     * @param {Integer} integer value to set
     */
    this.setByInteger = function(intValue) {
        var bi = new BigInteger(String(intValue), 10);
        this.setByBigInteger(bi);
    };

    /**
     * set value by integer value
     * @name setValueHex
     * @memberOf KJUR.asn1.DERInteger#
     * @function
     * @param {String} hexadecimal string of integer value
     * @description
     * <br/>
     * NOTE: Value shall be represented by minimum octet length of
     * two's complement representation.
     * @example
     * new KJUR.asn1.DERInteger(123);
     * new KJUR.asn1.DERInteger({'int': 123});
     * new KJUR.asn1.DERInteger({'hex': '1fad'});
     */
    this.setValueHex = function(newHexString) {
        this.hV = newHexString;
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };

    if (typeof params != "undefined") {
        if (typeof params['bigint'] != "undefined") {
            this.setByBigInteger(params['bigint']);
        } else if (typeof params['int'] != "undefined") {
            this.setByInteger(params['int']);
        } else if (typeof params == "number") {
            this.setByInteger(params);
        } else if (typeof params['hex'] != "undefined") {
            this.setValueHex(params['hex']);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERInteger, KJUR.asn1.ASN1Object);

// ********************************************************************
/**
 * class for ASN.1 DER encoded BitString primitive
 * @name KJUR.asn1.DERBitString
 * @class class for ASN.1 DER encoded BitString primitive
 * @extends KJUR.asn1.ASN1Object
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>bin - specify binary string (ex. '10111')</li>
 * <li>array - specify array of boolean (ex. [true,false,true,true])</li>
 * <li>hex - specify hexadecimal string of ASN.1 value(V) including unused bits</li>
 * <li>obj - specify {@link KJUR.asn1.ASN1Util.newObject}
 * argument for "BitString encapsulates" structure.</li>
 * </ul>
 * NOTE1: 'params' can be omitted.<br/>
 * NOTE2: 'obj' parameter have been supported since
 * asn1 1.0.11, jsrsasign 6.1.1 (2016-Sep-25).<br/>
 * @example
 * // default constructor
 * o = new KJUR.asn1.DERBitString();
 * // initialize with binary string
 * o = new KJUR.asn1.DERBitString({bin: "1011"});
 * // initialize with boolean array
 * o = new KJUR.asn1.DERBitString({array: [true,false,true,true]});
 * // initialize with hexadecimal string (04 is unused bits)
 * o = new KJUR.asn1.DEROctetString({hex: "04bac0"});
 * // initialize with ASN1Util.newObject argument for encapsulated
 * o = new KJUR.asn1.DERBitString({obj: {seq: [{int: 3}, {prnstr: 'aaa'}]}});
 * // above generates a ASN.1 data like this:
 * // BIT STRING, encapsulates {
 * //   SEQUENCE {
 * //     INTEGER 3
 * //     PrintableString 'aaa'
 * //     }
 * //   }
 */
KJUR.asn1.DERBitString = function(params) {
    if (params !== undefined && typeof params.obj !== "undefined") {
        var o = KJUR.asn1.ASN1Util.newObject(params.obj);
        params.hex = "00" + o.getEncodedHex();
    }
    KJUR.asn1.DERBitString.superclass.constructor.call(this);
    this.hT = "03";

    /**
     * set ASN.1 value(V) by a hexadecimal string including unused bits
     * @name setHexValueIncludingUnusedBits
     * @memberOf KJUR.asn1.DERBitString#
     * @function
     * @param {String} newHexStringIncludingUnusedBits
     */
    this.setHexValueIncludingUnusedBits = function(newHexStringIncludingUnusedBits) {
        this.hTLV = null;
        this.isModified = true;
        this.hV = newHexStringIncludingUnusedBits;
    };

    /**
     * set ASN.1 value(V) by unused bit and hexadecimal string of value
     * @name setUnusedBitsAndHexValue
     * @memberOf KJUR.asn1.DERBitString#
     * @function
     * @param {Integer} unusedBits
     * @param {String} hValue
     */
    this.setUnusedBitsAndHexValue = function(unusedBits, hValue) {
        if (unusedBits < 0 || 7 < unusedBits) {
            throw "unused bits shall be from 0 to 7: u = " + unusedBits;
        }
        var hUnusedBits = "0" + unusedBits;
        this.hTLV = null;
        this.isModified = true;
        this.hV = hUnusedBits + hValue;
    };

    /**
     * set ASN.1 DER BitString by binary string<br/>
     * @name setByBinaryString
     * @memberOf KJUR.asn1.DERBitString#
     * @function
     * @param {String} binaryString binary value string (i.e. '10111')
     * @description
     * Its unused bits will be calculated automatically by length of
     * 'binaryValue'. <br/>
     * NOTE: Trailing zeros '0' will be ignored.
     * @example
     * o = new KJUR.asn1.DERBitString();
     * o.setByBooleanArray("01011");
     */
    this.setByBinaryString = function(binaryString) {
        binaryString = binaryString.replace(/0+$/, '');
        var unusedBits = 8 - binaryString.length % 8;
        if (unusedBits == 8) unusedBits = 0;
        for (var i = 0; i <= unusedBits; i++) {
            binaryString += '0';
        }
        var h = '';
        for (var i = 0; i < binaryString.length - 1; i += 8) {
            var b = binaryString.substr(i, 8);
            var x = parseInt(b, 2).toString(16);
            if (x.length == 1) x = '0' + x;
            h += x;
        }
        this.hTLV = null;
        this.isModified = true;
        this.hV = '0' + unusedBits + h;
    };

    /**
     * set ASN.1 TLV value(V) by an array of boolean<br/>
     * @name setByBooleanArray
     * @memberOf KJUR.asn1.DERBitString#
     * @function
     * @param {array} booleanArray array of boolean (ex. [true, false, true])
     * @description
     * NOTE: Trailing falses will be ignored in the ASN.1 DER Object.
     * @example
     * o = new KJUR.asn1.DERBitString();
     * o.setByBooleanArray([false, true, false, true, true]);
     */
    this.setByBooleanArray = function(booleanArray) {
        var s = '';
        for (var i = 0; i < booleanArray.length; i++) {
            if (booleanArray[i] == true) {
                s += '1';
            } else {
                s += '0';
            }
        }
        this.setByBinaryString(s);
    };

    /**
     * generate an array of falses with specified length<br/>
     * @name newFalseArray
     * @memberOf KJUR.asn1.DERBitString
     * @function
     * @param {Integer} nLength length of array to generate
     * @return {array} array of boolean falses
     * @description
     * This static method may be useful to initialize boolean array.
     * @example
     * o = new KJUR.asn1.DERBitString();
     * o.newFalseArray(3) &rarr; [false, false, false]
     */
    this.newFalseArray = function(nLength) {
        var a = new Array(nLength);
        for (var i = 0; i < nLength; i++) {
            a[i] = false;
        }
        return a;
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };

    if (typeof params != "undefined") {
        if (typeof params == "string" && params.toLowerCase().match(/^[0-9a-f]+$/)) {
            this.setHexValueIncludingUnusedBits(params);
        } else if (typeof params['hex'] != "undefined") {
            this.setHexValueIncludingUnusedBits(params['hex']);
        } else if (typeof params['bin'] != "undefined") {
            this.setByBinaryString(params['bin']);
        } else if (typeof params['array'] != "undefined") {
            this.setByBooleanArray(params['array']);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERBitString, KJUR.asn1.ASN1Object);

// ********************************************************************
/**
 * class for ASN.1 DER OctetString<br/>
 * @name KJUR.asn1.DEROctetString
 * @class class for ASN.1 DER OctetString
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @extends KJUR.asn1.DERAbstractString
 * @description
 * This class provides ASN.1 OctetString simple type.<br/>
 * Supported "params" attributes are:
 * <ul>
 * <li>str - to set a string as a value</li>
 * <li>hex - to set a hexadecimal string as a value</li>
 * <li>obj - to set a encapsulated ASN.1 value by JSON object
 * which is defined in {@link KJUR.asn1.ASN1Util.newObject}</li>
 * </ul>
 * NOTE: A parameter 'obj' have been supported
 * for "OCTET STRING, encapsulates" structure.
 * since asn1 1.0.11, jsrsasign 6.1.1 (2016-Sep-25).
 * @see KJUR.asn1.DERAbstractString - superclass
 * @example
 * // default constructor
 * o = new KJUR.asn1.DEROctetString();
 * // initialize with string
 * o = new KJUR.asn1.DEROctetString({str: "aaa"});
 * // initialize with hexadecimal string
 * o = new KJUR.asn1.DEROctetString({hex: "616161"});
 * // initialize with ASN1Util.newObject argument
 * o = new KJUR.asn1.DEROctetString({obj: {seq: [{int: 3}, {prnstr: 'aaa'}]}});
 * // above generates a ASN.1 data like this:
 * // OCTET STRING, encapsulates {
 * //   SEQUENCE {
 * //     INTEGER 3
 * //     PrintableString 'aaa'
 * //     }
 * //   }
 */
KJUR.asn1.DEROctetString = function(params) {
    if (params !== undefined && typeof params.obj !== "undefined") {
        var o = KJUR.asn1.ASN1Util.newObject(params.obj);
        params.hex = o.getEncodedHex();
    }
    KJUR.asn1.DEROctetString.superclass.constructor.call(this, params);
    this.hT = "04";
};
YAHOO.lang.extend(KJUR.asn1.DEROctetString, KJUR.asn1.DERAbstractString);

// ********************************************************************
/**
 * class for ASN.1 DER Null
 * @name KJUR.asn1.DERNull
 * @class class for ASN.1 DER Null
 * @extends KJUR.asn1.ASN1Object
 * @description
 * @see KJUR.asn1.ASN1Object - superclass
 */
KJUR.asn1.DERNull = function() {
    KJUR.asn1.DERNull.superclass.constructor.call(this);
    this.hT = "05";
    this.hTLV = "0500";
};
YAHOO.lang.extend(KJUR.asn1.DERNull, KJUR.asn1.ASN1Object);

// ********************************************************************
/**
 * class for ASN.1 DER ObjectIdentifier
 * @name KJUR.asn1.DERObjectIdentifier
 * @class class for ASN.1 DER ObjectIdentifier
 * @param {Array} params associative array of parameters (ex. {'oid': '2.5.4.5'})
 * @extends KJUR.asn1.ASN1Object
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>oid - specify initial ASN.1 value(V) by a oid string (ex. 2.5.4.13)</li>
 * <li>hex - specify initial ASN.1 value(V) by a hexadecimal string</li>
 * </ul>
 * NOTE: 'params' can be omitted.
 */
KJUR.asn1.DERObjectIdentifier = function(params) {
    var itox = function(i) {
        var h = i.toString(16);
        if (h.length == 1) h = '0' + h;
        return h;
    };
    var roidtox = function(roid) {
        var h = '';
        var bi = new BigInteger(roid, 10);
        var b = bi.toString(2);
        var padLen = 7 - b.length % 7;
        if (padLen == 7) padLen = 0;
        var bPad = '';
        for (var i = 0; i < padLen; i++) bPad += '0';
        b = bPad + b;
        for (var i = 0; i < b.length - 1; i += 7) {
            var b8 = b.substr(i, 7);
            if (i != b.length - 7) b8 = '1' + b8;
            h += itox(parseInt(b8, 2));
        }
        return h;
    };

    KJUR.asn1.DERObjectIdentifier.superclass.constructor.call(this);
    this.hT = "06";

    /**
     * set value by a hexadecimal string
     * @name setValueHex
     * @memberOf KJUR.asn1.DERObjectIdentifier#
     * @function
     * @param {String} newHexString hexadecimal value of OID bytes
     */
    this.setValueHex = function(newHexString) {
        this.hTLV = null;
        this.isModified = true;
        this.s = null;
        this.hV = newHexString;
    };

    /**
     * set value by a OID string<br/>
     * @name setValueOidString
     * @memberOf KJUR.asn1.DERObjectIdentifier#
     * @function
     * @param {String} oidString OID string (ex. 2.5.4.13)
     * @example
     * o = new KJUR.asn1.DERObjectIdentifier();
     * o.setValueOidString("2.5.4.13");
     */
    this.setValueOidString = function(oidString) {
        if (! oidString.match(/^[0-9.]+$/)) {
            throw "malformed oid string: " + oidString;
        }
        var h = '';
        var a = oidString.split('.');
        var i0 = parseInt(a[0]) * 40 + parseInt(a[1]);
        h += itox(i0);
        a.splice(0, 2);
        for (var i = 0; i < a.length; i++) {
            h += roidtox(a[i]);
        }
        this.hTLV = null;
        this.isModified = true;
        this.s = null;
        this.hV = h;
    };

    /**
     * set value by a OID name
     * @name setValueName
     * @memberOf KJUR.asn1.DERObjectIdentifier#
     * @function
     * @param {String} oidName OID name (ex. 'serverAuth')
     * @since 1.0.1
     * @description
     * OID name shall be defined in 'KJUR.asn1.x509.OID.name2oidList'.
     * Otherwise raise error.
     * @example
     * o = new KJUR.asn1.DERObjectIdentifier();
     * o.setValueName("serverAuth");
     */
    this.setValueName = function(oidName) {
        var oid = KJUR.asn1.x509.OID.name2oid(oidName);
        if (oid !== '') {
            this.setValueOidString(oid);
        } else {
            throw "DERObjectIdentifier oidName undefined: " + oidName;
        }
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };

    if (params !== undefined) {
        if (typeof params === "string") {
            if (params.match(/^[0-2].[0-9.]+$/)) {
                this.setValueOidString(params);
            } else {
                this.setValueName(params);
            }
        } else if (params.oid !== undefined) {
            this.setValueOidString(params.oid);
        } else if (params.hex !== undefined) {
            this.setValueHex(params.hex);
        } else if (params.name !== undefined) {
            this.setValueName(params.name);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERObjectIdentifier, KJUR.asn1.ASN1Object);

// ********************************************************************
/**
 * class for ASN.1 DER Enumerated
 * @name KJUR.asn1.DEREnumerated
 * @class class for ASN.1 DER Enumerated
 * @extends KJUR.asn1.ASN1Object
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>int - specify initial ASN.1 value(V) by integer value</li>
 * <li>hex - specify initial ASN.1 value(V) by a hexadecimal string</li>
 * </ul>
 * NOTE: 'params' can be omitted.
 * @example
 * new KJUR.asn1.DEREnumerated(123);
 * new KJUR.asn1.DEREnumerated({int: 123});
 * new KJUR.asn1.DEREnumerated({hex: '1fad'});
 */
KJUR.asn1.DEREnumerated = function(params) {
    KJUR.asn1.DEREnumerated.superclass.constructor.call(this);
    this.hT = "0a";

    /**
     * set value by Tom Wu's BigInteger object
     * @name setByBigInteger
     * @memberOf KJUR.asn1.DEREnumerated#
     * @function
     * @param {BigInteger} bigIntegerValue to set
     */
    this.setByBigInteger = function(bigIntegerValue) {
        this.hTLV = null;
        this.isModified = true;
        this.hV = KJUR.asn1.ASN1Util.bigIntToMinTwosComplementsHex(bigIntegerValue);
    };

    /**
     * set value by integer value
     * @name setByInteger
     * @memberOf KJUR.asn1.DEREnumerated#
     * @function
     * @param {Integer} integer value to set
     */
    this.setByInteger = function(intValue) {
        var bi = new BigInteger(String(intValue), 10);
        this.setByBigInteger(bi);
    };

    /**
     * set value by integer value
     * @name setValueHex
     * @memberOf KJUR.asn1.DEREnumerated#
     * @function
     * @param {String} hexadecimal string of integer value
     * @description
     * <br/>
     * NOTE: Value shall be represented by minimum octet length of
     * two's complement representation.
     */
    this.setValueHex = function(newHexString) {
        this.hV = newHexString;
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };

    if (typeof params != "undefined") {
        if (typeof params['int'] != "undefined") {
            this.setByInteger(params['int']);
        } else if (typeof params == "number") {
            this.setByInteger(params);
        } else if (typeof params['hex'] != "undefined") {
            this.setValueHex(params['hex']);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DEREnumerated, KJUR.asn1.ASN1Object);

// ********************************************************************
/**
 * class for ASN.1 DER UTF8String
 * @name KJUR.asn1.DERUTF8String
 * @class class for ASN.1 DER UTF8String
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @extends KJUR.asn1.DERAbstractString
 * @description
 * @see KJUR.asn1.DERAbstractString - superclass
 */
KJUR.asn1.DERUTF8String = function(params) {
    KJUR.asn1.DERUTF8String.superclass.constructor.call(this, params);
    this.hT = "0c";
};
YAHOO.lang.extend(KJUR.asn1.DERUTF8String, KJUR.asn1.DERAbstractString);

// ********************************************************************
/**
 * class for ASN.1 DER NumericString
 * @name KJUR.asn1.DERNumericString
 * @class class for ASN.1 DER NumericString
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @extends KJUR.asn1.DERAbstractString
 * @description
 * @see KJUR.asn1.DERAbstractString - superclass
 */
KJUR.asn1.DERNumericString = function(params) {
    KJUR.asn1.DERNumericString.superclass.constructor.call(this, params);
    this.hT = "12";
};
YAHOO.lang.extend(KJUR.asn1.DERNumericString, KJUR.asn1.DERAbstractString);

// ********************************************************************
/**
 * class for ASN.1 DER PrintableString
 * @name KJUR.asn1.DERPrintableString
 * @class class for ASN.1 DER PrintableString
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @extends KJUR.asn1.DERAbstractString
 * @description
 * @see KJUR.asn1.DERAbstractString - superclass
 */
KJUR.asn1.DERPrintableString = function(params) {
    KJUR.asn1.DERPrintableString.superclass.constructor.call(this, params);
    this.hT = "13";
};
YAHOO.lang.extend(KJUR.asn1.DERPrintableString, KJUR.asn1.DERAbstractString);

// ********************************************************************
/**
 * class for ASN.1 DER TeletexString
 * @name KJUR.asn1.DERTeletexString
 * @class class for ASN.1 DER TeletexString
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @extends KJUR.asn1.DERAbstractString
 * @description
 * @see KJUR.asn1.DERAbstractString - superclass
 */
KJUR.asn1.DERTeletexString = function(params) {
    KJUR.asn1.DERTeletexString.superclass.constructor.call(this, params);
    this.hT = "14";
};
YAHOO.lang.extend(KJUR.asn1.DERTeletexString, KJUR.asn1.DERAbstractString);

// ********************************************************************
/**
 * class for ASN.1 DER IA5String
 * @name KJUR.asn1.DERIA5String
 * @class class for ASN.1 DER IA5String
 * @param {Array} params associative array of parameters (ex. {'str': 'aaa'})
 * @extends KJUR.asn1.DERAbstractString
 * @description
 * @see KJUR.asn1.DERAbstractString - superclass
 */
KJUR.asn1.DERIA5String = function(params) {
    KJUR.asn1.DERIA5String.superclass.constructor.call(this, params);
    this.hT = "16";
};
YAHOO.lang.extend(KJUR.asn1.DERIA5String, KJUR.asn1.DERAbstractString);

// ********************************************************************
/**
 * class for ASN.1 DER UTCTime
 * @name KJUR.asn1.DERUTCTime
 * @class class for ASN.1 DER UTCTime
 * @param {Array} params associative array of parameters (ex. {'str': '130430235959Z'})
 * @extends KJUR.asn1.DERAbstractTime
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>str - specify initial ASN.1 value(V) by a string (ex.'130430235959Z')</li>
 * <li>hex - specify initial ASN.1 value(V) by a hexadecimal string</li>
 * <li>date - specify Date object.</li>
 * </ul>
 * NOTE: 'params' can be omitted.
 * <h4>EXAMPLES</h4>
 * @example
 * d1 = new KJUR.asn1.DERUTCTime();
 * d1.setString('130430125959Z');
 *
 * d2 = new KJUR.asn1.DERUTCTime({'str': '130430125959Z'});
 * d3 = new KJUR.asn1.DERUTCTime({'date': new Date(Date.UTC(2015, 0, 31, 0, 0, 0, 0))});
 * d4 = new KJUR.asn1.DERUTCTime('130430125959Z');
 */
KJUR.asn1.DERUTCTime = function(params) {
    KJUR.asn1.DERUTCTime.superclass.constructor.call(this, params);
    this.hT = "17";

    /**
     * set value by a Date object<br/>
     * @name setByDate
     * @memberOf KJUR.asn1.DERUTCTime#
     * @function
     * @param {Date} dateObject Date object to set ASN.1 value(V)
     * @example
     * o = new KJUR.asn1.DERUTCTime();
     * o.setByDate(new Date("2016/12/31"));
     */
    this.setByDate = function(dateObject) {
        this.hTLV = null;
        this.isModified = true;
        this.date = dateObject;
        this.s = this.formatDate(this.date, 'utc');
        this.hV = stohex(this.s);
    };

    this.getFreshValueHex = function() {
        if (typeof this.date == "undefined" && typeof this.s == "undefined") {
            this.date = new Date();
            this.s = this.formatDate(this.date, 'utc');
            this.hV = stohex(this.s);
        }
        return this.hV;
    };

    if (params !== undefined) {
        if (params.str !== undefined) {
            this.setString(params.str);
        } else if (typeof params == "string" && params.match(/^[0-9]{12}Z$/)) {
            this.setString(params);
        } else if (params.hex !== undefined) {
            this.setStringHex(params.hex);
        } else if (params.date !== undefined) {
            this.setByDate(params.date);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERUTCTime, KJUR.asn1.DERAbstractTime);

// ********************************************************************
/**
 * class for ASN.1 DER GeneralizedTime
 * @name KJUR.asn1.DERGeneralizedTime
 * @class class for ASN.1 DER GeneralizedTime
 * @param {Array} params associative array of parameters (ex. {'str': '20130430235959Z'})
 * @property {Boolean} withMillis flag to show milliseconds or not
 * @extends KJUR.asn1.DERAbstractTime
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>str - specify initial ASN.1 value(V) by a string (ex.'20130430235959Z')</li>
 * <li>hex - specify initial ASN.1 value(V) by a hexadecimal string</li>
 * <li>date - specify Date object.</li>
 * <li>millis - specify flag to show milliseconds (from 1.0.6)</li>
 * </ul>
 * NOTE1: 'params' can be omitted.
 * NOTE2: 'withMillis' property is supported from asn1 1.0.6.
 */
KJUR.asn1.DERGeneralizedTime = function(params) {
    KJUR.asn1.DERGeneralizedTime.superclass.constructor.call(this, params);
    this.hT = "18";
    this.withMillis = false;

    /**
     * set value by a Date object
     * @name setByDate
     * @memberOf KJUR.asn1.DERGeneralizedTime#
     * @function
     * @param {Date} dateObject Date object to set ASN.1 value(V)
     * @example
     * When you specify UTC time, use 'Date.UTC' method like this:<br/>
     * o1 = new DERUTCTime();
     * o1.setByDate(date);
     *
     * date = new Date(Date.UTC(2015, 0, 31, 23, 59, 59, 0)); #2015JAN31 23:59:59
     */
    this.setByDate = function(dateObject) {
        this.hTLV = null;
        this.isModified = true;
        this.date = dateObject;
        this.s = this.formatDate(this.date, 'gen', this.withMillis);
        this.hV = stohex(this.s);
    };

    this.getFreshValueHex = function() {
        if (this.date === undefined && this.s === undefined) {
            this.date = new Date();
            this.s = this.formatDate(this.date, 'gen', this.withMillis);
            this.hV = stohex(this.s);
        }
        return this.hV;
    };

    if (params !== undefined) {
        if (params.str !== undefined) {
            this.setString(params.str);
        } else if (typeof params == "string" && params.match(/^[0-9]{14}Z$/)) {
            this.setString(params);
        } else if (params.hex !== undefined) {
            this.setStringHex(params.hex);
        } else if (params.date !== undefined) {
            this.setByDate(params.date);
        }
        if (params.millis === true) {
            this.withMillis = true;
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERGeneralizedTime, KJUR.asn1.DERAbstractTime);

// ********************************************************************
/**
 * class for ASN.1 DER Sequence
 * @name KJUR.asn1.DERSequence
 * @class class for ASN.1 DER Sequence
 * @extends KJUR.asn1.DERAbstractStructured
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>array - specify array of ASN1Object to set elements of content</li>
 * </ul>
 * NOTE: 'params' can be omitted.
 */
KJUR.asn1.DERSequence = function(params) {
    KJUR.asn1.DERSequence.superclass.constructor.call(this, params);
    this.hT = "30";
    this.getFreshValueHex = function() {
        var h = '';
        for (var i = 0; i < this.asn1Array.length; i++) {
            var asn1Obj = this.asn1Array[i];
            h += asn1Obj.getEncodedHex();
        }
        this.hV = h;
        return this.hV;
    };
};
YAHOO.lang.extend(KJUR.asn1.DERSequence, KJUR.asn1.DERAbstractStructured);

// ********************************************************************
/**
 * class for ASN.1 DER Set
 * @name KJUR.asn1.DERSet
 * @class class for ASN.1 DER Set
 * @extends KJUR.asn1.DERAbstractStructured
 * @description
 * <br/>
 * As for argument 'params' for constructor, you can specify one of
 * following properties:
 * <ul>
 * <li>array - specify array of ASN1Object to set elements of content</li>
 * <li>sortflag - flag for sort (default: true). ASN.1 BER is not sorted in 'SET OF'.</li>
 * </ul>
 * NOTE1: 'params' can be omitted.<br/>
 * NOTE2: sortflag is supported since 1.0.5.
 */
KJUR.asn1.DERSet = function(params) {
    KJUR.asn1.DERSet.superclass.constructor.call(this, params);
    this.hT = "31";
    this.sortFlag = true; // item shall be sorted only in ASN.1 DER
    this.getFreshValueHex = function() {
        var a = new Array();
        for (var i = 0; i < this.asn1Array.length; i++) {
            var asn1Obj = this.asn1Array[i];
            a.push(asn1Obj.getEncodedHex());
        }
        if (this.sortFlag == true) a.sort();
        this.hV = a.join('');
        return this.hV;
    };

    if (typeof params != "undefined") {
        if (typeof params.sortflag != "undefined" &&
            params.sortflag == false)
            this.sortFlag = false;
    }
};
YAHOO.lang.extend(KJUR.asn1.DERSet, KJUR.asn1.DERAbstractStructured);

// ********************************************************************
/**
 * class for ASN.1 DER TaggedObject
 * @name KJUR.asn1.DERTaggedObject
 * @class class for ASN.1 DER TaggedObject
 * @extends KJUR.asn1.ASN1Object
 * @description
 * <br/>
 * Parameter 'tagNoNex' is ASN.1 tag(T) value for this object.
 * For example, if you find '[1]' tag in a ASN.1 dump,
 * 'tagNoHex' will be 'a1'.
 * <br/>
 * As for optional argument 'params' for constructor, you can specify *ANY* of
 * following properties:
 * <ul>
 * <li>explicit - specify true if this is explicit tag otherwise false
 *     (default is 'true').</li>
 * <li>tag - specify tag (default is 'a0' which means [0])</li>
 * <li>obj - specify ASN1Object which is tagged</li>
 * </ul>
 * @example
 * d1 = new KJUR.asn1.DERUTF8String({'str':'a'});
 * d2 = new KJUR.asn1.DERTaggedObject({'obj': d1});
 * hex = d2.getEncodedHex();
 */
KJUR.asn1.DERTaggedObject = function(params) {
    KJUR.asn1.DERTaggedObject.superclass.constructor.call(this);
    this.hT = "a0";
    this.hV = '';
    this.isExplicit = true;
    this.asn1Object = null;

    /**
     * set value by an ASN1Object
     * @name setString
     * @memberOf KJUR.asn1.DERTaggedObject#
     * @function
     * @param {Boolean} isExplicitFlag flag for explicit/implicit tag
     * @param {Integer} tagNoHex hexadecimal string of ASN.1 tag
     * @param {ASN1Object} asn1Object ASN.1 to encapsulate
     */
    this.setASN1Object = function(isExplicitFlag, tagNoHex, asn1Object) {
        this.hT = tagNoHex;
        this.isExplicit = isExplicitFlag;
        this.asn1Object = asn1Object;
        if (this.isExplicit) {
            this.hV = this.asn1Object.getEncodedHex();
            this.hTLV = null;
            this.isModified = true;
        } else {
            this.hV = null;
            this.hTLV = asn1Object.getEncodedHex();
            this.hTLV = this.hTLV.replace(/^../, tagNoHex);
            this.isModified = false;
        }
    };

    this.getFreshValueHex = function() {
        return this.hV;
    };

    if (typeof params != "undefined") {
        if (typeof params['tag'] != "undefined") {
            this.hT = params['tag'];
        }
        if (typeof params['explicit'] != "undefined") {
            this.isExplicit = params['explicit'];
        }
        if (typeof params['obj'] != "undefined") {
            this.asn1Object = params['obj'];
            this.setASN1Object(this.isExplicit, this.hT, this.asn1Object);
        }
    }
};
YAHOO.lang.extend(KJUR.asn1.DERTaggedObject, KJUR.asn1.ASN1Object);

/**
 * Create a new JSEncryptRSAKey that extends Tom Wu's RSA key object.
 * This object is just a decorator for parsing the key parameter
 * @param {string|Object} key - The key in string format, or an object containing
 * the parameters needed to build a RSAKey object.
 * @constructor
 */
var JSEncryptRSAKey = /** @class */ (function (_super) {
    __extends(JSEncryptRSAKey, _super);
    function JSEncryptRSAKey(key) {
        var _this = _super.call(this) || this;
        // Call the super constructor.
        //  RSAKey.call(this);
        // If a key key was provided.
        if (key) {
            // If this is a string...
            if (typeof key === "string") {
                _this.parseKey(key);
            }
            else if (JSEncryptRSAKey.hasPrivateKeyProperty(key) ||
                JSEncryptRSAKey.hasPublicKeyProperty(key)) {
                // Set the values for the key.
                _this.parsePropertiesFrom(key);
            }
        }
        return _this;
    }
    /**
     * Method to parse a pem encoded string containing both a public or private key.
     * The method will translate the pem encoded string in a der encoded string and
     * will parse private key and public key parameters. This method accepts public key
     * in the rsaencryption pkcs #1 format (oid: 1.2.840.113549.1.1.1).
     *
     * @todo Check how many rsa formats use the same format of pkcs #1.
     *
     * The format is defined as:
     * PublicKeyInfo ::= SEQUENCE {
     *   algorithm       AlgorithmIdentifier,
     *   PublicKey       BIT STRING
     * }
     * Where AlgorithmIdentifier is:
     * AlgorithmIdentifier ::= SEQUENCE {
     *   algorithm       OBJECT IDENTIFIER,     the OID of the enc algorithm
     *   parameters      ANY DEFINED BY algorithm OPTIONAL (NULL for PKCS #1)
     * }
     * and PublicKey is a SEQUENCE encapsulated in a BIT STRING
     * RSAPublicKey ::= SEQUENCE {
     *   modulus           INTEGER,  -- n
     *   publicExponent    INTEGER   -- e
     * }
     * it's possible to examine the structure of the keys obtained from openssl using
     * an asn.1 dumper as the one used here to parse the components: http://lapo.it/asn1js/
     * @argument {string} pem the pem encoded string, can include the BEGIN/END header/footer
     * @private
     */
    JSEncryptRSAKey.prototype.parseKey = function (pem) {
        try {
            var modulus = 0;
            var public_exponent = 0;
            var reHex = /^\s*(?:[0-9A-Fa-f][0-9A-Fa-f]\s*)+$/;
            var der = reHex.test(pem) ? Hex.decode(pem) : Base64.unarmor(pem);
            var asn1 = ASN1.decode(der);
            // Fixes a bug with OpenSSL 1.0+ private keys
            if (asn1.sub.length === 3) {
                asn1 = asn1.sub[2].sub[0];
            }
            if (asn1.sub.length === 9) {
                // Parse the private key.
                modulus = asn1.sub[1].getHexStringValue(); // bigint
                this.n = parseBigInt(modulus, 16);
                public_exponent = asn1.sub[2].getHexStringValue(); // int
                this.e = parseInt(public_exponent, 16);
                var private_exponent = asn1.sub[3].getHexStringValue(); // bigint
                this.d = parseBigInt(private_exponent, 16);
                var prime1 = asn1.sub[4].getHexStringValue(); // bigint
                this.p = parseBigInt(prime1, 16);
                var prime2 = asn1.sub[5].getHexStringValue(); // bigint
                this.q = parseBigInt(prime2, 16);
                var exponent1 = asn1.sub[6].getHexStringValue(); // bigint
                this.dmp1 = parseBigInt(exponent1, 16);
                var exponent2 = asn1.sub[7].getHexStringValue(); // bigint
                this.dmq1 = parseBigInt(exponent2, 16);
                var coefficient = asn1.sub[8].getHexStringValue(); // bigint
                this.coeff = parseBigInt(coefficient, 16);
            }
            else if (asn1.sub.length === 2) {
                // Parse the public key.
                var bit_string = asn1.sub[1];
                var sequence = bit_string.sub[0];
                modulus = sequence.sub[0].getHexStringValue();
                this.n = parseBigInt(modulus, 16);
                public_exponent = sequence.sub[1].getHexStringValue();
                this.e = parseInt(public_exponent, 16);
            }
            else {
                return false;
            }
            return true;
        }
        catch (ex) {
            return false;
        }
    };
    /**
     * Translate rsa parameters in a hex encoded string representing the rsa key.
     *
     * The translation follow the ASN.1 notation :
     * RSAPrivateKey ::= SEQUENCE {
     *   version           Version,
     *   modulus           INTEGER,  -- n
     *   publicExponent    INTEGER,  -- e
     *   privateExponent   INTEGER,  -- d
     *   prime1            INTEGER,  -- p
     *   prime2            INTEGER,  -- q
     *   exponent1         INTEGER,  -- d mod (p1)
     *   exponent2         INTEGER,  -- d mod (q-1)
     *   coefficient       INTEGER,  -- (inverse of q) mod p
     * }
     * @returns {string}  DER Encoded String representing the rsa private key
     * @private
     */
    JSEncryptRSAKey.prototype.getPrivateBaseKey = function () {
        var options = {
            array: [
                new KJUR.asn1.DERInteger({ int: 0 }),
                new KJUR.asn1.DERInteger({ bigint: this.n }),
                new KJUR.asn1.DERInteger({ int: this.e }),
                new KJUR.asn1.DERInteger({ bigint: this.d }),
                new KJUR.asn1.DERInteger({ bigint: this.p }),
                new KJUR.asn1.DERInteger({ bigint: this.q }),
                new KJUR.asn1.DERInteger({ bigint: this.dmp1 }),
                new KJUR.asn1.DERInteger({ bigint: this.dmq1 }),
                new KJUR.asn1.DERInteger({ bigint: this.coeff })
            ]
        };
        var seq = new KJUR.asn1.DERSequence(options);
        return seq.getEncodedHex();
    };
    /**
     * base64 (pem) encoded version of the DER encoded representation
     * @returns {string} pem encoded representation without header and footer
     * @public
     */
    JSEncryptRSAKey.prototype.getPrivateBaseKeyB64 = function () {
        return hex2b64(this.getPrivateBaseKey());
    };
    /**
     * Translate rsa parameters in a hex encoded string representing the rsa public key.
     * The representation follow the ASN.1 notation :
     * PublicKeyInfo ::= SEQUENCE {
     *   algorithm       AlgorithmIdentifier,
     *   PublicKey       BIT STRING
     * }
     * Where AlgorithmIdentifier is:
     * AlgorithmIdentifier ::= SEQUENCE {
     *   algorithm       OBJECT IDENTIFIER,     the OID of the enc algorithm
     *   parameters      ANY DEFINED BY algorithm OPTIONAL (NULL for PKCS #1)
     * }
     * and PublicKey is a SEQUENCE encapsulated in a BIT STRING
     * RSAPublicKey ::= SEQUENCE {
     *   modulus           INTEGER,  -- n
     *   publicExponent    INTEGER   -- e
     * }
     * @returns {string} DER Encoded String representing the rsa public key
     * @private
     */
    JSEncryptRSAKey.prototype.getPublicBaseKey = function () {
        var first_sequence = new KJUR.asn1.DERSequence({
            array: [
                new KJUR.asn1.DERObjectIdentifier({ oid: "1.2.840.113549.1.1.1" }),
                new KJUR.asn1.DERNull()
            ]
        });
        var second_sequence = new KJUR.asn1.DERSequence({
            array: [
                new KJUR.asn1.DERInteger({ bigint: this.n }),
                new KJUR.asn1.DERInteger({ int: this.e })
            ]
        });
        var bit_string = new KJUR.asn1.DERBitString({
            hex: "00" + second_sequence.getEncodedHex()
        });
        var seq = new KJUR.asn1.DERSequence({
            array: [
                first_sequence,
                bit_string
            ]
        });
        return seq.getEncodedHex();
    };
    /**
     * base64 (pem) encoded version of the DER encoded representation
     * @returns {string} pem encoded representation without header and footer
     * @public
     */
    JSEncryptRSAKey.prototype.getPublicBaseKeyB64 = function () {
        return hex2b64(this.getPublicBaseKey());
    };
    /**
     * wrap the string in block of width chars. The default value for rsa keys is 64
     * characters.
     * @param {string} str the pem encoded string without header and footer
     * @param {Number} [width=64] - the length the string has to be wrapped at
     * @returns {string}
     * @private
     */
    JSEncryptRSAKey.wordwrap = function (str, width) {
        width = width || 64;
        if (!str) {
            return str;
        }
        var regex = "(.{1," + width + "})( +|$\n?)|(.{1," + width + "})";
        return str.match(RegExp(regex, "g")).join("\n");
    };
    /**
     * Retrieve the pem encoded private key
     * @returns {string} the pem encoded private key with header/footer
     * @public
     */
    JSEncryptRSAKey.prototype.getPrivateKey = function () {
        var key = "-----BEGIN RSA PRIVATE KEY-----\n";
        key += JSEncryptRSAKey.wordwrap(this.getPrivateBaseKeyB64()) + "\n";
        key += "-----END RSA PRIVATE KEY-----";
        return key;
    };
    /**
     * Retrieve the pem encoded public key
     * @returns {string} the pem encoded public key with header/footer
     * @public
     */
    JSEncryptRSAKey.prototype.getPublicKey = function () {
        var key = "-----BEGIN PUBLIC KEY-----\n";
        key += JSEncryptRSAKey.wordwrap(this.getPublicBaseKeyB64()) + "\n";
        key += "-----END PUBLIC KEY-----";
        return key;
    };
    /**
     * Check if the object contains the necessary parameters to populate the rsa modulus
     * and public exponent parameters.
     * @param {Object} [obj={}] - An object that may contain the two public key
     * parameters
     * @returns {boolean} true if the object contains both the modulus and the public exponent
     * properties (n and e)
     * @todo check for types of n and e. N should be a parseable bigInt object, E should
     * be a parseable integer number
     * @private
     */
    JSEncryptRSAKey.hasPublicKeyProperty = function (obj) {
        obj = obj || {};
        return (obj.hasOwnProperty("n") &&
            obj.hasOwnProperty("e"));
    };
    /**
     * Check if the object contains ALL the parameters of an RSA key.
     * @param {Object} [obj={}] - An object that may contain nine rsa key
     * parameters
     * @returns {boolean} true if the object contains all the parameters needed
     * @todo check for types of the parameters all the parameters but the public exponent
     * should be parseable bigint objects, the public exponent should be a parseable integer number
     * @private
     */
    JSEncryptRSAKey.hasPrivateKeyProperty = function (obj) {
        obj = obj || {};
        return (obj.hasOwnProperty("n") &&
            obj.hasOwnProperty("e") &&
            obj.hasOwnProperty("d") &&
            obj.hasOwnProperty("p") &&
            obj.hasOwnProperty("q") &&
            obj.hasOwnProperty("dmp1") &&
            obj.hasOwnProperty("dmq1") &&
            obj.hasOwnProperty("coeff"));
    };
    /**
     * Parse the properties of obj in the current rsa object. Obj should AT LEAST
     * include the modulus and public exponent (n, e) parameters.
     * @param {Object} obj - the object containing rsa parameters
     * @private
     */
    JSEncryptRSAKey.prototype.parsePropertiesFrom = function (obj) {
        this.n = obj.n;
        this.e = obj.e;
        if (obj.hasOwnProperty("d")) {
            this.d = obj.d;
            this.p = obj.p;
            this.q = obj.q;
            this.dmp1 = obj.dmp1;
            this.dmq1 = obj.dmq1;
            this.coeff = obj.coeff;
        }
    };
    return JSEncryptRSAKey;
}(RSAKey));

/**
 *
 * @param {Object} [options = {}] - An object to customize JSEncrypt behaviour
 * possible parameters are:
 * - default_key_size        {number}  default: 1024 the key size in bit
 * - default_public_exponent {string}  default: '010001' the hexadecimal representation of the public exponent
 * - log                     {boolean} default: false whether log warn/error or not
 * @constructor
 */
var JSEncrypt = /** @class */ (function () {
    function JSEncrypt(options) {
        options = options || {};
        this.default_key_size = parseInt(options.default_key_size, 10) || 1024;
        this.default_public_exponent = options.default_public_exponent || "010001"; // 65537 default openssl public exponent for rsa key type
        this.log = options.log || false;
        // The private and public key.
        this.key = null;
    }
    /**
     * Method to set the rsa key parameter (one method is enough to set both the public
     * and the private key, since the private key contains the public key paramenters)
     * Log a warning if logs are enabled
     * @param {Object|string} key the pem encoded string or an object (with or without header/footer)
     * @public
     */
    JSEncrypt.prototype.setKey = function (key) {
        if (this.log && this.key) {
            console.warn("A key was already set, overriding existing.");
        }
        this.key = new JSEncryptRSAKey(key);
    };
    /**
     * Proxy method for setKey, for api compatibility
     * @see setKey
     * @public
     */
    JSEncrypt.prototype.setPrivateKey = function (privkey) {
        // Create the key.
        this.setKey(privkey);
    };
    /**
     * Proxy method for setKey, for api compatibility
     * @see setKey
     * @public
     */
    JSEncrypt.prototype.setPublicKey = function (pubkey) {
        // Sets the public key.
        this.setKey(pubkey);
    };
    /**
     * Proxy method for RSAKey object's decrypt, decrypt the string using the private
     * components of the rsa key object. Note that if the object was not set will be created
     * on the fly (by the getKey method) using the parameters passed in the JSEncrypt constructor
     * @param {string} str base64 encoded crypted string to decrypt
     * @return {string} the decrypted string
     * @public
     */
    JSEncrypt.prototype.decrypt = function (str) {
        // Return the decrypted string.
        try {
            return this.getKey().decrypt(b64tohex(str));
        }
        catch (ex) {
            return false;
        }
    };
    /**
     * Proxy method for RSAKey object's encrypt, encrypt the string using the public
     * components of the rsa key object. Note that if the object was not set will be created
     * on the fly (by the getKey method) using the parameters passed in the JSEncrypt constructor
     * @param {string} str the string to encrypt
     * @return {string} the encrypted string encoded in base64
     * @public
     */
    JSEncrypt.prototype.encrypt = function (str) {
        // Return the encrypted string.
        try {
            return hex2b64(this.getKey().encrypt(str));
        }
        catch (ex) {
            return false;
        }
    };
    /**
     * Proxy method for RSAKey object's sign.
     * @param {string} str the string to sign
     * @param {function} digestMethod hash method
     * @param {string} digestName the name of the hash algorithm
     * @return {string} the signature encoded in base64
     * @public
     */
    JSEncrypt.prototype.sign = function (str, digestMethod, digestName) {
        // return the RSA signature of 'str' in 'hex' format.
        try {
            return hex2b64(this.getKey().sign(str, digestMethod, digestName));
        }
        catch (ex) {
            return false;
        }
    };
    /**
     * Proxy method for RSAKey object's verify.
     * @param {string} str the string to verify
     * @param {string} signature the signature encoded in base64 to compare the string to
     * @param {function} digestMethod hash method
     * @return {boolean} whether the data and signature match
     * @public
     */
    JSEncrypt.prototype.verify = function (str, signature, digestMethod) {
        // Return the decrypted 'digest' of the signature.
        try {
            return this.getKey().verify(str, b64tohex(signature), digestMethod);
        }
        catch (ex) {
            return false;
        }
    };
    /**
     * Getter for the current JSEncryptRSAKey object. If it doesn't exists a new object
     * will be created and returned
     * @param {callback} [cb] the callback to be called if we want the key to be generated
     * in an async fashion
     * @returns {JSEncryptRSAKey} the JSEncryptRSAKey object
     * @public
     */
    JSEncrypt.prototype.getKey = function (cb) {
        // Only create new if it does not exist.
        if (!this.key) {
            // Get a new private key.
            this.key = new JSEncryptRSAKey();
            if (cb && {}.toString.call(cb) === "[object Function]") {
                this.key.generateAsync(this.default_key_size, this.default_public_exponent, cb);
                return;
            }
            // Generate the key.
            this.key.generate(this.default_key_size, this.default_public_exponent);
        }
        return this.key;
    };
    /**
     * Returns the pem encoded representation of the private key
     * If the key doesn't exists a new key will be created
     * @returns {string} pem encoded representation of the private key WITH header and footer
     * @public
     */
    JSEncrypt.prototype.getPrivateKey = function () {
        // Return the private representation of this key.
        return this.getKey().getPrivateKey();
    };
    /**
     * Returns the pem encoded representation of the private key
     * If the key doesn't exists a new key will be created
     * @returns {string} pem encoded representation of the private key WITHOUT header and footer
     * @public
     */
    JSEncrypt.prototype.getPrivateKeyB64 = function () {
        // Return the private representation of this key.
        return this.getKey().getPrivateBaseKeyB64();
    };
    /**
     * Returns the pem encoded representation of the public key
     * If the key doesn't exists a new key will be created
     * @returns {string} pem encoded representation of the public key WITH header and footer
     * @public
     */
    JSEncrypt.prototype.getPublicKey = function () {
        // Return the private representation of this key.
        return this.getKey().getPublicKey();
    };
    /**
     * Returns the pem encoded representation of the public key
     * If the key doesn't exists a new key will be created
     * @returns {string} pem encoded representation of the public key WITHOUT header and footer
     * @public
     */
    JSEncrypt.prototype.getPublicKeyB64 = function () {
        // Return the private representation of this key.
        return this.getKey().getPublicBaseKeyB64();
    };
    JSEncrypt.version = "3.0.0-rc.1";
    return JSEncrypt;
}());

window.JSEncrypt = JSEncrypt;

exports.JSEncrypt = JSEncrypt;




})));
function test(pwd, key) {
    var e = new JSEncrypt;
    e.setPublicKey(key)
    return e.encrypt(pwd);

}
    ����secretdate  �  function secretdate(times) {
    //var e = new Date().getTime(),
        t = random_char(32), r = "timestamp=" + times + "&nonce=" + t;
    return r;
}
function random_char(e) {
    for (var t = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], r = "", n = 0; n < e; n++) {
        var a = Math.ceil(35 * Math.random());
        r += t[a];
    }
    return r;
} �   ����uuid  �  function uuid() {
    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 32,
        t = !(arguments.length > 1 && void 0 !== arguments[1]) || arguments[1],
        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null,
        n = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".split(""),
        a = [];
    if (r = r || n.length, e) for (var i = 0; i < e; i++) a[i] = n[0 | Math.random() * r];
    else {
        var l;
        a[8] = a[13] = a[18] = a[23] = "-", a[14] = "4";
        for (var o = 0; o < 36; o++) a[o] || (l = 0 | 16 * Math.random(), a[o] = n[19 == o ? 3 & l | 8 : l]);
    }
    return t ? (a.shift(), "u" + a.join("")) : a.join("");
}     s��?�s ������s s s s s s          ���g w                                          �� ?�   x  @                                          9   krnlnd09f2340818511d396f6aaf844c7e32557ϵͳ����֧�ֿ�:   iext27bb20fdd3e145e4bee3db39ddd6e64c20��չ����֧�ֿ�һ8   specA512548E76954B6E92C21055517615B031���⹦��֧�ֿ�9   dp14BB4003860154917BC7D8230BF4FA58A20���ݲ���֧�ֿ�һ=   edroptarget{9DA96BF9CEBD45c5BFCF94CBE61671F5}20�Ϸ�֧�ֿ�9   EThread5F99C1642A2F4e03850721B4F5D7C3F820���߳�֧�ֿ�                     	_b}bI��M �M��M           ����1                IbR       ���ڳ���_����mian    D   `b��a�h���������������� �;�Z�+���   �   c�q�������������       /   E   \   n   �   �        �   A_conPath     }bI      A_mg_arr       �   A_islogin      �   A_fileHead      �   A_cri     @�I   A_proxy      �   A_Main_Account       �   A_Start      ����   mg    4   ~bb�b�b�b�b�b\��b�b}�U��   8   �b��          cbA   A_account       �   proxy  �    `b~bb�b�b�b�b�b�b�b��a�h�}����������������� �+�;�U�Z�\�����M�M �M �M �M@�M`�M��M��M��M��M�N`�W��W��W��W��W �W �W@�W �W@�W`�W��W��W��W��W �W �W@�W`�W  	     �   _�����ӳ���   ���ӳ����ڳ�������������ִ��                          8                   K   j              6        j               6        j    ��          6_b           _����mian_�������          ��%    
     �   a          T       M   �   �   
  g  �  �  '  ;  h  �  �  �    ;  �  �  �  L  �     
  �  :       g      h   _   �   �   �   @  y  �  �  _  z  �  �  �  �       M  o  �  �    -  ^  �  �  �        j����          6   0000                                 j4               68Hb9	   IbR7   ���ڳ�ʼ������... j               8��7!�               8ab7j4               68c�7!               6!A               6   \mmmggcon.ini l               6!'               6!2              68c�7   usinfo    path     j���          68ab7!2              68c�7   usinfo    path       @  Rsj    ��          6j4               68��%7!               6!A               6   \mgggLog.txt j    ��          6mn               6!�               68��%7j4               68��7!�               68��%7j�               68��7Soj�               68��%7 j4               68��7!�               68��%7Ttj4               68��7!              6j4               68��9	     7!2              68c�7   usinfo 	   proxyApi j    ��          6j4               68�9	     7!2              68c�7   usinfo    sle j4               68�9	     7!2              68c�7   usinfo    fth j4               68�9	     7!2              68c�7   usinfo    sth j4               68�9	     7!`               6!2              68c�7   usinfo    set    \n   ��}bI           _��ʼ��,   �����ڱ���Ķ��󱻴����󣬴˷����ᱻ�Զ�����                                         i  j4               68�b9vb5cbA7A  Mozilla/5.0 (Linux; Android 12; V1981A Build/SP1A.210812.003; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.141 Mobile Safari/537.36 XWEB/5049 MMWEBSDK/20230202 MMWEBID/4644 MicroMessenger/8.0.33.2320(0x28002151) WeChat/arm64 Weixin NetType/WIFI Language/zh_CN ABI/arm64 MiniProgramEnv/android }bI           _����,   �����ڱ���Ķ�������ǰ���˷����ᱻ�Զ�����                                          j    ��          6}bI     �   �ӳ���login   ���ص�¼��Ϣ   H   �b%�b%��%       !      בI   json       �   str     �I   js     p   �b%�b%�b%��%       ,   =        �   user �˺�      �   passwd ����      �   wxid       �  _proxy  @       !   >   ^   �   �   �   *  8  Z  �  �  2  {  �  �  	   Z  �  <   !   >   �   �   �   C  U  �  8  ~  �    T  ^   �   p   !   >   �   �   �   �   "  <  �  �  .  8  O  ~  �  �      D  T        �  �  �  �  ^   �      8   �  j4               68��78��%7jX���          8��%7��j����          8�b%7   {} j����          8�b%7	   deviceid !]���          8��%7   uuid j����          8�b%7   remark     j����          8�b%7	   username 8�b%7j����          8�b%7	   password 8�b%7j4               68�b%7!���          6!����          6=   https://wxapi.mgsco.cn:8085/wxapi/S_User_Login/CheckUserName       �?!����          8�b%7!               6   User-Agent:  8�b9vb5cbA7     Content-Type: application/json 8��%7j����          8�b%78�b%7��l               6!'               6!����          8�b%7   token     j4               68�b9ib5cbA7!����          8�b%7   token j4               68�b9fb5cbA7!����          8�b%7   id j4               68�b9�b5cbA7!����          8�b%7	   username j4               68�b9gb5cbA78�b%7j4               68�b9B�5cbA7      �?Rsj               68�b%7}bI     �   �ӳ���getlist   ��ȡ�����б�   N   �b%�b%�b%       %        �   postdata       �   str     בI   json          0       V   v   �   �   	  4  c  �  �  6  f      ,   V   v   �   	  4  |  �  �   �  �    H   V   v   �   �   	  4  u  �  �   �   �  �  �  ~  �    x  ,      �  j    ��      C   {"userid":"125837","lx":3,"wxuserid":"","page":1,"cartypestr":"0"} 6j����          8�b%7   {} j����          8�b%7   userid 8�b9fb5cbA7j����          8�b%7   lx       @j����          8�b%7	   wxuserid 8�b9gb5cbA7j����          8�b%7   page       �?j����          8�b%7   cartypestr    0 j4               68�b%7!�b��          6!����          8�b%7j4               68�b%7!Қ��          68�b%7����j4               68�b%7!���          6!����          61   https://wxapi.mgsco.cn:8085/wxapi/Task/GetQdlist       �?!               6	   sendstr= 8�b%7!               6   User-Agent:  8�b9vb5cbA7  0   Content-Type: application/x-www-form-urlencoded      Authorization: Bearer  8�b9ib5cbA78��7j    ��         ������� (����ȡ�б���, str) 6j               68�b%7}bI     �   �ӳ���getcar   ��ȡ�˺ų�����Ϣ�����ƺ�   N   �b%�b%�b%       !      בI   json       �   str       �   postdata          (           T   �   �   	  a  �  �  �      (           �   �   �   T   "  4  �  �  L           C   �   �   �   �   T   y     �  �  B  �  �  �  �    W        j����          8�b%7   {} j����          8�b%7   userid 8�b9fb5cbA7j����          8�b%7	   wxuserid 8�b9gb5cbA7j4               68�b%7!�b��          6!����          8�b%7j4               68�b%7!Қ��          68�b%7����j4               68�b%7!���          6!����          66   https://wxapi.mgsco.cn:8085/wxapi/Task/GetUserCarlist       �?!               6   userid= 8�b%7!               6   User-Agent:  8�b9vb5cbA7  0   Content-Type: application/x-www-form-urlencoded      Authorization: Bearer  8�b9ib5cbA78��7j    ��         ������� (����ȡ������, str) 6j����          8�b%78�b%7��j4               68�b9hb5cbA7!����          8�b%7   data[0].cph j               68�b%7}bI     �   �ӳ���getordid   ��ȡĳ����״̬��Ϣ   N   �b%�b%�b%       !      בI   json       �   str       �   postdata        �b%         �   ordid  $           H   q   �   �   &  v  �      $           H   �   �   q     ?  Q  @           @   H   �   �   q   �   �     8  �  �  W  �  l      �  j����          8�b%7   {} j����          8�b%7   tid 8�b%7j����          8�b%7   flag    1 j����          8�b%7	   wxuserid 8�b9gb5cbA7j4               68�b%7!�b��          6!����          8�b%7j4               68�b%7!Қ��          68�b%7����j4               68�b%7!���          6!����          61   https://wxapi.mgsco.cn:8085/wxapi/Task/GetLdinfo       �?!               6   tid= 8�b%7!               6   User-Agent:  8�b9vb5cbA7  0   Content-Type: application/x-www-form-urlencoded      Authorization: Bearer  8�b9ib5cbA78��7j    ��      !   ������� (����ȡ������Ϣ��, str) 6j               68�b%7}bI     �
   �ӳ���send   �ύ����   �   �b%�b%�b%�b%�b%�b%�b%��%       &   8   I   Y   n         �I   js       �   secretdate       �   times     בI   json       �   str       �   postdata     %�I   data       �   Mgps     _   �b%�b%��%       7        �   ordid ������      �   validate ��֤������      �  Gps  P       �   �   �     <  g  �  �  @  �  �  �    3  {  �    l  �      X   �   �   �     <  g  �  �  �  $  Y  k  �  �    3  Z  {  �  8  J  �  �   �   �   �   �       <  _  g  �  �  �    6  R  k  �  �  �  �    +  3  l  {  �  �  �    1  �  �  M  b  �     =   K      �   �  j4               68��%7!�               6!'               68��%7    8��%70   ���ȣ�112.36953γ�ȣ�37.54548�ٶȣ�-1��ȷ�ȣ�16 j4               68�b%7!����          6jX���          8�b%7#1j4               68�b%7!]���          8�b%7   secretdate 8�b%7j����          8�b%7   {} j����          8�b%7   cymxid 8�b%7j����          8�b%7   carid !ܚ��          68�b9hb5cbA7j����          8�b%7   flag    1 j����          8�b%7	   deviceid !               68�b9gb5cbA7   ~ !ܚ��          68��%7j4               68�b%7!�b��          6!����          8�b%7j4               68�b%7!Қ��          68�b%7����j    ��          6j���          8�b%7   userid 8�b9fb5cbA7j���          8�b%7	   validate 8�b%7j���          8�b%7   secretdate !Қ��          68�b%7����j���          8�b%7	   secreted !              6!f               6!               68�b9gb5cbA78�b%7j���          8�b%7
   verifystr 8�b%7j4               68�b%7!���          6!����          6:   https://wxapi.mgsco.cn:8085/wxapi/Task/UndeVRojJyMUFjDhYQ       �?!���          8�b%7!               6   User-Agent:  8�b9vb5cbA7  0   Content-Type: application/x-www-form-urlencoded      Authorization: Bearer  8�b9ib5cbA78��7j    ��      %   ������� (str, data.��ȡPost���� ()) 6j               68�b%7}bI      �
   �ӳ������          �b%         �   Key     !   �b%         �   ���������ı�         �         �     &  6        �  P  j4               68�b%7�  -----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvnnA4C8lJgXgQrzzt7PA8SJ9IqbkDhHrVxmfjU+tSvHy+oxBBh4IkKwupBjaPawI/23Ep2DAHD4FptQt4iUr33nnCWJFjFI+ic97BentcsrP4RFkfoyurID/YyUsa/DZZPg8xDmmswbRDeNscKnfjuG5BQiQBXJK3VpAdZrUOBmWNPf7WhZZCjKh3RojG8GeSQwJTjMCmXUkk+gwSTBSNCK5a3HgToQ5L4bJpg7zljVLR1yCg9As/yW8sqkhlvsXLwBo7FNWebA+/TJs2+M1HgeNx8O0O9td+Kv1jYwSliWEubf959x75xG9KvTijOrK0Gz6qsHpc6LgNpCScAe+PQIDAQAB-----END PUBLIC KEY----- j               6!����          6�/   test !               6   ' 8�b%7   ',' 8�b%7   '       �@}bI     �   �ӳ���getCode          �b%         �   str        �b%         �   ordid         T   v                �      +   2   B       �   j4               68�b%7!��
��          68�b%78�b9vb5cbA78��7      4@j    ��         ������� (str) 6j               68�b%7_b           _�ϷŶ���1_�õ��ļ�               %   ��%         �   ���յ����ļ�·��         /                 A   ^             f   j���          68ab78��%7      @  j3              68c�7   usinfo    path 8��%7_b           _�����б���1_�Ҽ���������                                                j�               68\�&7_b           _��¼ȫ��_��ѡ��                                                j               6��}bI   cbA
   getAccount                                                j               68�b7_b           �ӳ���1       \   ��%��%��%��%          ,        �   str  
    �   i  
   cbA   m       �   mip          x          0   M   �   �   	  ,  c  o  �  �  �  I  �  �  ;  N  �  �  3  �  �  �    [  ~  �  �  �  ?       /   �   �  	  b  H  :  �  �  �  �    }     E  o  �  �  �  |  �      _   i   B   �   �   �   �     >  E  �  �  �  �  �    7  m  �  �  �    (  u  |  �  �  �    "  K  f  N  w  �    3  \  v  �  �  �  �  �  �    C  �  m  t      �  l               68��7j               6Rsj4               68��7��j7               68q�7  !?              8ab7p               6!8               68q�78��%7j5              8ab7!               68��%7      �?      @
   ��¼��... l               68��9     7j4               68��%7!4���          8��7��Rsj4               68��%7!�b��          8q�:8��%77!0              8ab7!               68��%7      �?      �?!0              8ab7!               68��%7      �?       @!0              8ab7!               68��%7      �?      @8��%7j����          68��%7j����          6!�b��          8q�:8��%77j4               68��%7!}���          8q�:8��%77j5              8ab7!               68��%7      �?      @8��%9fb5cbA7mn               6!&               68��%9hb5cbA7    j5              8ab7!               68��%7      �?      @   wxid��ƥ�䣬�޷���ȡ Soj5              8ab7!               68��%7      �?      @8��%9hb5cbA7Ttj    ��          6j5              8ab7!               68��%7      �?      @8��%9ib5cbA7j5              8ab7!               68��%7      �?       @8��%9��5cbA7mn               6!&               68��%9�b5cbA7    j5              8ab7!               68��%7      �?      "@8��%7Soj5              8ab7!               68��%7      �?      "@8��%9�b5cbA7Ttj    ��          6l               6!&               68��7        l               6!'               68��%9ib5cbA7    j4               68��78��%7Rsj    ��          6Rsj    ��          6Uq               6j4               68��7  _b           addLog                  ��%         �   str            |                 �   ,   s       �   j              68��7j�               68��7!               6!Z               6!�               6   >> 8��%7j              68��7_b0          _����mian_��������                              -              %       @   j�               6j              68��7j               6_b           _ѡ���1_������                            E   h   �     +  @  U     D   T  h   *     �         3   W   �   �         h  j3              68c�7   usinfo 	   proxyApi 8��9	     7mn               68��9     7l               6!&               6!3���          8��78��9	     7        j�               6   ������ȡʧ�ܣ�       0@!�               6j4               68��9     7  Rsj    ��          6Soj    ��          6Ttj    ��          6_b           _��Ϊ����_��ѡ��       ,   ��%�%       
    �   n  
   cbA   m          @       +   a   �   �      F  Y  �  �  .  k  �  �  �  �     *   �  �   �  �  �     r  (         O   �   �  k  r  �  @  Y      �  j4               68��%78ab9$     7mn               6!&               68��%7      �j�               6   δѡ���˺�       0@!�               6Soj    ��          6mn               6!&               6!8               68q�7        j�               6   δ��¼�κ��˺�       0@!�               6Soj    ��          6j4               68�%7!}���          8q�:!               68��%7      �?7mn               6!&               68�%9ib5cbA7    j�               6   �˺�δ��¼       0@!�               6Soj4               68��7!               68��%7      �?j�               6	   ���óɹ�       @@!�               6Ttj    ��          6Ttj    ��          6j    ��          6Ttj    ��          6_b           _��¼_��ѡ��       r   ��%��%��%��%��%          ,   <   
    �   n  
    �   i       �   mip       �   str  
   cbA   m          �       +   a   �   �   �   6  I  \  �  �    F  Y  e    �  �  ?  {  �  1  D  �  �  )  v  �  �    Q  t  �  �  ?   *   �  �   5  �  E  >  0  �  �    s  �  �     (  r  e    �  �  �         O   �       �  �  �  !  (  k  r  �  �  �  �    A  \  w  �  �  �  �    -  c  {  �  �      D  m  �  �  �  �    )  R  l  v  �  �  n  �    9  c  j      �  j4               68��%78ab9$     7mn               6!&               68��%7      �j�               6   δѡ���˺�       0@!�               6Soj    ��          6l               6!&               6!8               68q�7        j7               68q�7  !?              8ab7Rsj    ��          6j    ��          6j4               68��%7!               68��%7      �?j5              8ab7!               68��%7      �?      @
   ��¼��... l               68��9     7j4               68��%7!4���          8��7��Rsj    ��          6j4               68��%7!�b��          8q�:8��%77!0              8ab7!               68��%7      �?      �?!0              8ab7!               68��%7      �?       @!0              8ab7!               68��%7      �?      @8��%7j����          68��%7j����          6!�b��          8q�:8��%77j4               68��%7!}���          8q�:8��%77j5              8ab7!               68��%7      �?      @8��%9fb5cbA7mn               6!&               68��%9hb5cbA7    j5              8ab7!               68��%7      �?      @   wxid��ƥ�䣬�޷���ȡ Soj5              8ab7!               68��%7      �?      @8��%9hb5cbA7Ttj    ��          6j5              8ab7!               68��%7      �?      @8��%9ib5cbA7j5              8ab7!               68��%7      �?       @8��%9��5cbA7mn               6!&               68��%9�b5cbA7    j5              8ab7!               68��%7      �?      "@8��%7Soj5              8ab7!               68��%7      �?      "@8��%9�b5cbA7Ttj    ��          6l               6!&               68��7        l               6!'               68��%9ib5cbA7    j4               68��78��%7Rsj    ��          6Rsj    ��          6Ttj    ��          6_b           _�˳�_��ѡ��       B   �%	�%�%          
   cbA   m  
    �   i  
    �   n          8       +   a   �   �   �   <  s  �  �  0  �  �  .     *   -  �   r     s  \         O   )  �   �   N  X  �  �  �      0  Y  s  �  �  �  �      s      A  j4               68�%78ab9$     7mn               6!&               68�%7      �j�               6   δѡ���˺�       0@!�               6Soj    ��          6j4               68	�%7!               68�%7      �?l               6!&               6!8               68q�7        j7               68q�7  !?              8ab7Rsj���          8q�:8	�%77j5              8ab7!               68	�%7      �?      @    j5              8ab7!               68	�%7      �?      @8�%9hb5cbA7j5              8ab7!               68	�%7      �?      @8�%9ib5cbA7j5              8ab7!               68	�%7      �?       @8�%9��5cbA7j5              8ab7!               68	�%7      �?      "@8�%9�b5cbA7Ttj    ��          6}bI          Exit          �%    
   cbA   a                                      !   j4               68�b78�%7_b           _��ť2_������                    $          0   o   �   �   Q  �  �         /   Q  �     �  (      B   ^   �   �   �   �   �   -  u      �  l               68��7j               6Rsj3              68c�7   usinfo    sle 8�9	     7j3              68c�7   usinfo    fth 8�9	     7j3              68c�7   usinfo    sth 8�9	     7j3              68c�7   usinfo    set !`               68�9	     7     \n ��p               6!w              68�9	     7j               6 �Uq               6_b           �ӳ���F5    	   �   !�%%�%(�%1�%4�%7�%8�%��%��%       '   5   F   V   d   v   �        �   str       �      shdarr  
    �   i     בI   json       �   shd  
    �   k       �   ordid      �   SleepTime       �   rettxt          �       C   �   �   �   /  w  �  �  �    *  ^  �  �  �      +  >  [  �  �  �    ^  �  +  �    6  j  �  �  '  <  P  c  �  �  �  �  �    !  W  s  �  ~   C   �   �   �  �    *  +  ^    �    �  �  ^  �  6  P  j  �  �  ;  c  �  �    !  r     �  �  p  �  D  �  W  �      +   y     �  �  �    N  V  �  �  �  �  �  P  m  �  �  �  �  �    p  �  �  �    =  D  �  �  �  �  �    .  Z  b  �  �  �    �  �  E  i  �      �  j4               68%�%7!d               68�9	     7  l               6!&               6!8               68%�%7        j�               6   ��û�����õ���       0@!�               6j               6Rsl               6!&               6!8               68q�7        j�               6   ��û�е�¼�κ��˺�       0@!�               6j               6Rsj    ��          6p               6!8               68%�%78(�%7j4               68%�%:8(�%77!^               68%�%:8(�%77Uq               6p               6!8               68%�%78(�%7p               6!8               68%�%78(�%7l               6!&               68%�%:8(�%77    j=               68%�%78(�%7j               6Rsj    ��          6Uq               6Uq               6j4               68��7��j4               68��%7!w              68�9	     7p               6j4               68!�%7!�b��          8q�:8��77j����          81�%78!�%7��j4               68��%7!               6!Z               6!�               6  p               6!����          81�%7   data 8(�%7j4               684�%7!����          81�%7!               6   data[ !Z               6!               68(�%7      �?   ].shd j4               688�%7!����          81�%7!               6   data[ !Z               6!               68(�%7      �?   ].id j4               68��%7!               68��%788�%7    >>  84�%7  j4               68��9	     78��%7p               6!8               68%�%787�%7l               6!)               6!R               684�%78%�%:87�%77          j               6;�!w              688�%7Rsl               6!/               68��7j               6Rsj    ��          6Uq               6l               6!/               68��7j               6Rsj    ��          6Uq               6l               6!/               68��7j               6Rsj    ��          6l               6!)               68��%7        j���          68��%7Rsj    ��          6Uq               68��7_b           _��ť3_������                                                j4               68��7  _b           tha       E   A�%F�%J�%          
    �   i  
   cbA   m       �   code        <�%        �   id  \       4   N   �   �   �     I  c  �  �  �  �  '  <  P  e  x  �  �  �  �  �  -       �  �   d  �  P  x  �  �  ;     g   c  �  H   $   ,   `   g   F   �   �   �     [  c  �  �  /  �  �  �          p               6!8               68q�78A�%7j              68��7j4               68F�%7!}���          8q�:8A�%77j              68��7l               6!&               68F�%9B�5cbA7      �?j4               68F�%9M�5cbA7!Z               68<�%7j4               68F�%9B�5cbA7      @j              68��7jU���          8q�:8A�%778F�%7j              68��7p               6!w              68�9	     7j               6Z�8A�%7l               6!/               68��7j               6Rsj    ��          6Uq               6Rsj    ��          6l               6!/               68��7j               6Rsj    ��          6Uq               6j    ��          6j    ��          6}bI       
   setAccount                  V�%       cbA   Paccount                              !   j4               68�b78V�%7_b           tha2       .   ��%��%            �   str  
   cbA   m        ��%        �   id  D       9   s   �     M  {  �  �  �  D  ^  �    ;  N  �     r   z  �  :        R   �    ^  N  �  t         K   R   �   1  �   �   �       _  �  �  �  �  �  #  ;  V  �  1  �  �  �  �  �  �  �      �  j4               68��%7!\���          8q�:8��%77j4               68��%7!}���          8q�:8��%77mn               6!)               6!R               68��%7	   �ύ�ɹ�           j              68��%78��%9fb5cbA78��%9�b5cbA78��%9M�5cbA78��%7j4               68��%9B�5cbA7       @Soj4               68��%9B�5cbA7      �?Ttj    ��          6j              68��7jU���          8q�:8��%778��%7j5              8ab7!               68��%7      �?      "@!               68��%9M�5cbA7   >> 8��%7j              68��7j����          6!               6!Z               68��%7   ** 8��%9M�5cbA7   ** 8��%7l               6!)               6!R               68��%7   </html>           jZ���          68��%7Rsj    ��          6j����          6!               6!Z               68��%7   ** 8��%9M�5cbA7   ** !�b��          8q�:8��%778��%9M�5cbA7j    ��          6}bI     �   AutoCodeSent       E  e�%f�%g�%h�%i�%j�%k�%l�%��%��%��%��%       &   8   I   Y   n      �   �   �   �      �I   js       �   secretdate       �   times     בI   json       �   str       �   postdata     %�I   data       �   Mgps       �   Code  	                 �   ordid ������      �   validate ��֤������         t          =   Z   �   �   �   �   �   �  �  �  +  K  v  �  �  O  �  �  �    B  �     .  {  �  �     =   �   �   �   \   s   �  �  �  +  K  v  �  �  �  3  h  z  �  �    B  i  �     G  Y  �  �   %   ,   l   �   �   �  �  �  �  "  +  K  n  v  �  �  �    E  a  z  �  �  �      :  B  {  �  �  �     &  @  �  �  \  q  �    :  Q     �  �  j    ��          6j4               68��%78�b9M�5cbA7p               6      $@j4               68��%7!�b��          68��%7l               6!'               68��%7    j               6Rsj    ��          6Uq               6j4               68l�%7!�               6!'               68�b9_�5cbA7    8�b9_�5cbA70   ���ȣ�112.36953γ�ȣ�37.54548�ٶȣ�-1��ȷ�ȣ�16 j4               68g�%7!����          6jX���          8e�%7#1j4               68f�%7!]���          8e�%7   secretdate 8g�%7j����          8h�%7   {} j����          8h�%7   cymxid 8��%7j����          8h�%7   carid !ܚ��          68�b9hb5cbA7j����          8h�%7   flag    1 j����          8h�%7	   deviceid !               68�b9gb5cbA7   ~ !ܚ��          68l�%7j4               68j�%7!�b��          6!����          8h�%7j4               68j�%7!Қ��          68j�%7����j    ��          6j���          8k�%7   userid 8�b9fb5cbA7j���          8k�%7	   validate 8��%7j���          8k�%7   secretdate !Қ��          68f�%7����j���          8k�%7	   secreted !              6!f               6!               68�b9gb5cbA78��%7j���          8k�%7
   verifystr 8j�%7j4               68i�%7!���          6!����          6:   https://wxapi.mgsco.cn:8085/wxapi/Task/UndeVRojJyMUFjDhYQ       �?!���          8k�%7!               6   User-Agent:  8�b9vb5cbA7  0   Content-Type: application/x-www-form-urlencoded      Authorization: Bearer  8�b9ib5cbA78��7j    ��      %   ������� (str, data.��ȡPost���� ()) 6j               68i�%7j    ��          6_b           _����mian_�״μ���                           C   i              {       �   j    ��      0   V8���Գ�ʼ�� (ȡ����Ŀ¼ () �� ȡִ���ļ��� ()) 6j    ��         Init_Dx_Js (-1, 5) 6j4               68Hb9	   IbR7               cbA �W       Account       W  db5eb5fb5gb5hb5ib5�b5vb5��5B�5M�5_�5       $   5   F   V   h   }   �   �   �   �        �   user       �   passwd       �   usid       �   wxid       �   car       �   token       �   username       �   UserAgent       �   Proxy  ,    �   Stues 1=�ѵ�¼��2=��������3=���ڽ���      �   Ordid       �   Gps     ��
��
�	X`	X        
   Init_Dx_Js       SubDxYT.dll
   Init_Dx_Js   4   ��E��E           �   GPUID      �   COUNT        �   Sub_Dx       SubDxYT.dll   Sub_Dx   q   ��E��E��E��E       -   ?        �   extraDate       �   User_agent       �   Proxy      �   Stime                                          sկCJs �׽��»��<s s s s s             |                                                                                                                                                                       s��}Ds ��¥������s s s s s                                                               s��!s ˨���Ļ��9s s s s s         |bI                                           }bI   s��XWs �ɳ����գ��s s s s s         �X���@                                             �  �@ בIҚ���������]�����X��I��4����	������ّڑۑܑݑޑߑ���������ؑ	x�y�z�{�|�}�~����������������������������������������������������������������������������������������������������������������������������ÑđőƑǑȑɑʑˑ̑͑ΑϑБёґӑԑՑ֑��A/�50�51�5��A2�53�54�55�5��A6�57�58�59�5��A:�5;�5<�5=�5>�5?�5@�5A�5B�5C�5D�5��AE�5F�5G�5��AH�5I�5J�5K�5L�5M�5��AN�5O�5P�5Q�5R�5S�5AT�5U�5V�5W�5ÒAX�5Y�5ĒAZ�5[�5ŒA\�5]�5^�5_�5`�5a�5b�5c�5ƒAd�5e�5f�5g�5h�5i�5ǒAj�5k�5l�5m�5ȒAn�5o�5p�5q�5r�5s�5t�5u�5v�5w�5x�5y�5z�5{�5ɒA|�5}�5~�5�5ʒA��5��5��5��5��5��5˒A��5��5��5̒A��5��5��5��5͒A��5��5��5��5��5��5��5ΒA��5��5��5ϒA��5��5��5��5��5��5ВA��5��5��5��5��5��5ђA��5��5��5��5��5��5��5ҒA��5��5��5��5��5��5��5��5ӒA��5��5��5��5��5��5��5��5��5��5ԒA��5��5��5ՒA��5��5��5¦5֒Aæ5Ħ5Ŧ5Ʀ5Ǧ5גAȦ5ɦ5ʦ5˦5̦5ͦ5ؒAΦ5Ϧ5Ц5Ѧ5Ҧ5Ӧ5Ԧ5զ5֦5צ5ْAئ5٦5ڒAڦ5ےAۦ5ܦ5ݦ5ަ5ܒAߦ5�5�5�5ݒA�5�5�5�5�5ޒA�5�5�5�5�5��5�5ߒA�5�5�5�5�5��5��5��5��5��5��5��5��5��5��5��5��5 �5�5�5��A�5�5�5�5�5�5	�5
�5�A�5�5�5�5�5�5�5�5�5�5�5�A�5�5�5�A�5�5�5�5�5�5�5 �5!�5"�5#�5$�5%�5&�5'�5(�5)�5*�5+�5�A,�5-�5.�5/�5�A0�51�52�53�54�55�56�57�58�59�5:�5;�5<�5=�5>�5�A?�5@�5A�5B�5C�5D�5E�5F�5G�5H�5I�5J�5K�5L�5�AM�5N�5�AO�5P�5�AQ�5R�5S�5T�5U�5V�5W�5X�5Y�5Z�5[�5\�5]�5^�5�A_�5`�5a�5b�5c�5d�5e�5�Af�5g�5h�5i�5j�5k�5l�5m�5�An�5o�5�Ap�5q�5r�5s�5t�5u�5v�5w�5x�5y�5z�5{�5�A|�5}�5~�5�5��5�A��5��5��5��5�A��5��5��5��5��5��5�A��5��5��5��5��5��5��5�A��5��5��5��5��5��5�A��5��5��5��5��5��5��5��5��5��5��A��5��5��5��A��5��5��5��5��5��A��5��5��5��A��5��5��5��5��5��5��5��5��5��5��5��5��5��5��A��5��5��5��5��5��5��5§5��Aç5ħ5ŧ5��AƧ5ǧ5��Aȧ5ɧ5ʧ5˧5̧5ͧ5Χ5ϧ5��AЧ5ѧ5ҧ5ӧ5ԧ5��Aէ5֧5ק5ا5٧5ڧ5-�.�C�
D�
E�
F�
G�
H�
I�
J�
K�
L�
M�
N�
O�
P�
Q�
R�
S�
T�
U�
V�
W�
X�
Y�
Z�
[�
\�
]�
^�
_�
`�
a�
b�
c�
d�
e�
f�
g�
h�
i�
j�
k�
l�
m�
n�
o�
p�
q�
r�
s�
t�
u�
v�
w�
x�
y�
z�
{�
|�
}�
~�
�
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��

Þ
Ğ
Ş
ƞ
Ǟ
Ȟ
ɞ
ʞ
˞
̞
͞
Ξ
Ϟ
О
ў
Ҟ
Ӟ
Ԟ
՞
֞
מ
؞
ٞ
ڞ
۞
ܞ
ݞ
ޞ
ߞ
��
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
��
��
��
��
��
��
��
��
��
��
��
��
 �
�
�
�
�
�
�
�
�
	�

�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
 �
!�
"�
#�
$�
%�
&�
'�
(�
)�
*�
+�
,�
-�
.�
/�
0�
1�
2�
3�
4�
5�
6�
7�
8�
9�
:�
;�
<�
=�
>�
?�
@�
A�
B�
C�
D�
E�
F�
G�
H�
I�
J�
K�
L�
M�
N�
O�
P�
Q�
R�
S�
T�
U�
V�
W�
X�
Y�
Z�
[�
\�
]�
^�
_�
`�
a�
b�
c�
d�
e�
f�
g�
h�
i�
j�
k�
l�
m�
n�
o�
p�
q�
r�
s�
t�
u�
v�
w�
x�
y�
z�
{�
|�
}�
~�
�
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��

ß
ğ
ş
Ɵ
ǟ
ȟ
ɟ
ʟ
˟
̟
͟
Ο
ϟ
П
џ
ҟ
ӟ
ԟ
՟
֟
ן
؟
ٟ
ڟ
۟
ܟ
ݟ
ޟ
ߟ
��
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
��
��
��
��
��
��
��
��
��
��
��
��
 �
�
�
�
�
�
�
�
�
	�

�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
 �
!�
"�
#�
$�
%�
&�
'�
(�
)�
*�
+�
,�
-�
.�
/�
0�
1�
2�
3�
4�
5�
6�
7�
8�
9�
:�
;�
<�
=�
>�
?�
@�
A�
B�
C�
D�
E�
F�
G�
H�
I�
J�
K�
L�
M�
N�
O�
P�
Q�
R�
S�
T�
U�
V�
W�
X�
Y�
Z�
[�
\�
]�
^�
_�
`�
a�
b�
c�
d�
e�
f�
g�
h�
i�
j�
k�
l�
m�
n�
o�
p�
q�
r�
s�
t�
u�
v�
w�
x�
y�
z�
{�
|�
}�
~�
�
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
��
 
à
Ġ
Š
Ơ
Ǡ
Ƞ
ɠ
ʠ
ˠ
̠
͠
Π
Ϡ
Р
Ѡ
Ҡ
Ӡ
Ԡ
ՠ
֠
נ
ؠ
٠
ڠ
۠
ܠ
ݠ
ޠ
ߠ
�
�
�
�
�
�
�
�
�
�
�
�
�
�������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������¡áġšơǡȡɡʡˡ̡͡ΡϡСѡҡӡԡա֡סء١ڡۡܡݡޡߡ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������¢âĢŢƢǢȢɢʢˢ̢͢΢ϢТѢҢӢԢբ֢עآ٢ڢۢܢݢޢߢ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������£ãģţƣǣȣɣʣˣ̣ͣΣϣУѣңӣԣգ֣ףأ٣ڣۣܣݣޣߣ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������¤äĤŤƤǤȤɤʤˤ̤ͤΤϤФѤҤӤԤդ֤פؤ٤ڤۤܤݤޤߤ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������¥åĥťƥǥȥɥʥ˥̥ͥΥϥХѥҥӥԥե֥ץإ٥ڥۥܥݥޥߥ��������������������������������������������� ���������	�
�������������(�(�(�(�(�(�(�(�(�( �(!�("�(#�($�(%�(&�('�((�()�*�+�,���I��I��I��I �I�I�I�I�I�I�I�I�I	�I
�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I �I!�I"�I#�I$�I%�I&�I'�I(�I)�I*�I+�I,�I-�I.�I/�I0�I1�I2�I3�I4�I5�I6�I7�I8�I9�I:�I;�I<�I=�I>�I?�I@�IA�IB�	���� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÓēœƓǓȓɓʓ˓̓͓ΓϓГѓғӓԓՓ֓דؓٓړۓܓݓޓߓ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÔĔŔƔǔȔɔʔ˔̔͔ΔϔДєҔӔԔՔ֔הؔٔڔ۔ܔݔޔߔ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�Y�Z�[�\�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÕĕŕƕǕȕɕʕ˕̕͕ΕϕЕѕҕӕԕՕ֕וؕٕڕەܕݕޕߕ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÖĖŖƖǖȖɖʖ˖̖͖ΖϖЖіҖӖԖՖ֖זؖٖږۖܖݖޖߖ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������×ėŗƗǗȗɗʗ˗̗͗ΗϗЗїҗӗԗ՗֗חؗٗڗۗܗݗޗߗ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ØĘŘƘǘȘɘʘ˘̘͘ΘϘИјҘӘԘ՘֘טؘ٘ژۘܘݘޘߘ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÙęřƙǙșəʙ˙̙͙ΙϙЙљҙәԙՙ֙יؙٙڙۙܙݙޙߙ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÚĚŚƚǚȚɚʚ˚̚͚ΚϚКњӚԚ՚֚ךؚٚښۚܚݚޚߚ�������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~����������������������������������������������������������������������������������������������������������������������������������ÛěśƛǛțɛʛ˛̛͛ΛϛЛћқӛԛ՛֛כ؛ٛڛۛܛݛޛߛ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÜĜŜƜǜȜɜʜ˜̜͜ΜϜМќҜӜԜ՜֜ל؜ٜڜۜܜݜޜߜ��������������������������������������������� ���������	�
���������������������� �!�"�#�$�%�&�'�(�)�*�+�,�-�.�/�0�1�2�3�4�5�6�7�8�9�:�;�<�=�>�?�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S�T�U�V�W�X�Y�Z�[�\�]�^�_�`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�z�{�|�}�~��������������������������������������������������������������������������������������������������������������������������������������ÝĝŝƝǝȝɝʝ˝̝͝ΝϝНѝҝӝԝ՝֝ם؝ٝڝ۝ܝݝޝߝ������������������������������������zj���0�j�s�f
�a�?֚�c�*�j�@���5_�VpV5Vu	J�J�
J6
J�
J�J�J�J�J3J#JzJrJ�JJ_����$�]ȷ���	�T	�a��	�%
��	�*������Ȧ�����0�1	Ȉ
�8�
Ҫ	�I	Ҡ
�@Ǘ���R���"��
ȉ	�I	̠
�K	��
�j��֚����
ʁ	�7ю���<� �w��ք�-��֣�M
��	��
և	և�S	Ȫ
�����s�
��	Ȯ
�W	�W� �G
��	Ȳ
�[	�_���
Ř	ţ�L�4���)	�d	�
��	z}z}z4��	�
�T
�%
R.l+t� r~b���A� ׄ�VuP�VbP"PiWHQ�Q�Q�Q�P�P��	�7ʃ	�F���XI� ͌	�$�6	�	Dfc� D�D�S�D=	D�
M�p� h1w�dKP�XX YY �	�\	��	��	�7�4	M� I� �X�VDD��	�L�
RCO�L�S�
�:	�Z���*���	�n	����	��	�T	��	���	�:	�:	�	�X	�(	�	���MϞ	ґ	҇	P�EP�A�B�U�IS��	I� ��M��������	������L�	�L�U���	����D	Ϣ	�A	͌	Ѥ	ϒ	�R	ύ	���P	��}	�X	�W	�?���I͌	׏	��	˿	����1���J	h�
r�
Ѷl�
la	l��	s;m� p� g�p�b��\	�ă	��	�����R	��	��	�z	����t	�J	��Ϻ�F	�[	�2��k	��q	������d�cZ	��t�tTc�twpd�k	��
��״�`���2�Z���*���
�Z���5��q	�\�ufmР���
Ǟ	�P	��	�Y	���?	��Os�(	�J	ʉ	� ��	����
�KΕ	���/	�I�/���ļ�"��	ĺ��
ĮԖ�7ȝ�{��î�{O�d�d:dFd�d�s�w www�w�
��
���C�=S_c� l�l�
ld� d� d.d/d�d�dvdwpcl.h�
h$h�
l�G)DKDLDMDNUXd�l�dnl�d�n�l�d�l�d�lid}l�dLlK	llwl�lZ	lH	l8l\l�
l6lfl�
l�l��;��Ͻ�a�6֋SN;TAR�
C�Un	K�I�
B�P�
I|H5R�
VsI���	�b	�k�9	�\	�w	�s����	�b	�k���9	�\	�w	�sC��^֋�e�c	͗	�4	ͷ
�i	M�I���	�p	�)	�	ʨ��I� �A���ԱĀ	df�hd	f��Ad�R	Լͽ�%��	C�c�r�rq	s]h�
h`	hm	WqL�fmsp�p�r�W�d�ff�f�n�n�d+d,c�
c$��	�:��ʕ	��	�A	��
�P	�kϫ	���C�n�R	���k�1΄	�o	I=	I�I�DPI9�;I�	I�I;J�
N�S�DDHI	HNTEL(C���	�\	�ă	I�tBk� K�w� w|dt/dKu<ww�5���	�^	�ISA�B5BLS�BjB��h	�8HY	GT	G[S$GIC�G?GHLNC�L�G�GSXs(s�����B��	RZZZ�Z�Z�ZyZ'G���	QmR	CoR-HHH�I4#D�E�L�R�R�R�AA�R�G�G�GWG�W�ACB�G�C�CoC!CxN�G�SG�C�P�RPSn	Gb	W�
G�D�F�FzF�S�g�U�g?s�c
s�I�W)g-G1r>s*n�i�
a�l�bh�s�c?W�WSi�
I"QzQ�A�IU�GKL�I�I G�G�S�F:G?G�
CiG�
M/LvF7GD�D�S�C�S�MyCCjC�C�C�CG�EeDW	L�
H�
GS`IKC}M>D8G�RA.GG�I
I�G-D_G�GKG�I*F�F+FDF�F�F�FP�F�F%F}R�F�V/GzG�l|l�
lll�ll�	li	Sa	l�l�l*G�G�G�CG�RC)S&U�W�
L�L�
R	RJR�G�Ry
G�C�C�R'&R�L�LV	R�Ds	W�
RT
V�VHVZW�	R�
R)R�W�
RH
R�
R�
C�W�
R"
M�MjG�G�PLP�PFP�P�DSxS-CM�IoI�DC�
S�M5M�
P�C�GV	FU	DjI�I�I.I�HCI�H�H�I1CIS�L�L�
I_G�SpG�C!S�S�S�
T~	S�SwCQC,ICC6O�l�l=
l lml S�Z�Z�R�S�W�IRDE�L�DGC"l$D�P�G�POQT�G�C�GL�SS�CNS�B�G�E"MG�Ij	IQ	I�Sv	FFle	W�GgR�
Gb	G�G�G�
B�V�M�C�C�G�I S�
It	E�E�E`S�R�EO[	G`	G�C�G�S�A�A{G�CjC�G)G>GTT\S�G�G�GP-P�P�PNI�IDIPC�PeO�OS�R�R9U�O�UqV�G"ClG�P�IHIZ	D:	GG�GwG�L�S�ESKS�SFG�w�w�CnG�E�SVGS�GG�ECQC"Sl	S�SCL�S�
G0S�S�L�S RmjG�G�CS�G�S�
D�EG�G�G}GIvR�R(RB	R�R�DO�kPS�SJS`W�S�Sm	K�
G?C�
GSR�
G�GHC~O�C|
l�P�GyG�C�C'WOOCC2D�C3S�Q�Q(CmC�Q�UQs	ZrC8G�I;Ԝ	ԃ	D�DAR=R�R�RrR�R=R�R:R%R�RA	R�R6G]G�C[I�LL�R�R5I�R�RAGJG�G�E�S-G�G�G`C�CPII�I�I#I�I�I�I�INI�I�IBI�I�I(S5SKGHL{G�GG�IqG�Q 	Q]G�G(LoC�S�R�S�G�GG�G�GG�G(U�I�CCl	D|IC�DS(R�RYD�
F�cA�R�RB	PnS$l%SyP�RdI�I�S�G�G�Z�GE�G�CWX	G&G{S�CGl�G�W�MVC;C�D:D�C-P�
S�G�G�G GA�T�g�C�I�IrIKW�W`W8W�WPW�W�WW�W�W_WdW�GFG0R�RR�I�RJCXO�R�G�G�RD\D�D-D�D�D�D-DFG�G�GAE�C�SNGBS�Gew�w�m�m�G�S�
GQS]G6SS��L�W�
NC�C�CC�DD"D�C�W�	II�I�S�SCC
CHEvEM%M�MMHM�M�MwM�E�W�Sk�l�)	F_	F�
FP%S[S�IsIuS#͞�o͊�V������P�	͆���	��Ͱ
�	͋
��
͐�z
�+
���ͼ
��
�����H	�R
�2	��
�m���x�'�|���f
ͪ́	�(
�
��	�8
���	��
��
�M	�	ͣ	�
͵ͭ	�
�	��ͬ��
�M
͓
͂
�L
�
�Q
ͺ	͊
��͚	�Q
�		ͷ�(�	�^	�5
��
�
;	͊
�5�[	�L	����
�	���O	�`	�o�U����	P1PIPrIV	P�P�PhMYPP#����F�JGxFwG�ObF�F>FwFGF�I�IKIJI{I'	IIW&I�'I\I���
����
�����0
�H!��
�k	��
 �W	�a!��GoS�S9SIS�D�SxS+SSS�SCS#S�SyShS�SeS�
SaS�S�S�SPSHS�S�SkS�SXSS�S/S�StS�S�S\S�SS!S�SgS�SS�SS S�S�S�
SSS S Sm	SbS>S]S�S�
Ss	S
Sm	S~	SSVS�SS�S-SS~S.Sx	SS�S_SfS�S�S�S�S�S;S�SXSxS�S�S�SFSuS�S�S�S�SkSSSDS�SMSS�ShS	Sy�

��	��	��	SWS�SLS�SwStI�I�	!I�	 I�I�	 SS�S@SNSkSSRS�S9S\S+S\S�S�SMSiS{SAS�S�S�S�SFSBSaSS�S�
SdSXS�SSSS SiSvS�
S�S�S�S�SS0S\
SI
SX
S�S�S�	S�	S�S8S�S�SSOA�S#S9S
S�U"H�H;H"HOHQHAK2KaK\Kd	K�
Rm	RR�
R�R�R�Rk	R	R�E�E�W;WAC,C�CuW(H�RR�
�(͢�����}͛Ͱ�~͜ͱ�;�B́�����7Wm	GbGmGkGa	G|BT	W�WE
"W�	 IoIW�W�W�WW�W�W$	W�W�W�W		W�WWM	W	W	WUW�(W�,V�SJWOWFW~W�	H�
I�S,SZS"SYS_SeNh	Ne	N)NASFS�E�F5F!F�F�G�sAN	Ab	ITjGwG�G�G�
G�GfGD��<���^���3�N���mρ
�e�Ϲ���gϒ	�ϐ
ρ�
�e	�����E�$��όϙ
ϒ
�Z��ϳ�0P�RZ�K�K.K�KK�KVK[	KDK�
K*KJKAKKKRKSK�K�K&K�KyK�K�K�K5KKKK�KKK�
K�KlK�K�
KBK�K�KK�K�KS�P�P#P�O�PdS�C�H�C=C?CLC@C_�
ʨ
ʉ�M��
��
�o�q�~�r���j	�l	�y	�m	��	�k	�m	�z	�n	��	�r�t���u�������������6�8N;C9	C;	C<	CR	C�
CG	C�C�C�C�CR	CxC�
C�
C=	C?	C�
C�C�CNC�C_C�CZ	C|C�C�CpC:C?C�C�C�C@	C�
C�C@CICJCKCO	CNCPCIC�C�CyCC�C�C9C8C�C!C�C�C�C�C�	C�C�
CSCQC�C�R�C�K�C�C�CCC�C%C`
#CwC�C�C�C�CCJC�CPP�P�	PP�P�	P7P{P/P8PP�P�P�P�	P\P�P�O�R,R�RyRR^R�RDRMR�R�R�R9R R	R4R�RGR�R�R@R�R�R�R=RLRvR�R�R�RRRbRR@R�R$R�RwRrR�R�RR�RR R.RFRR�RR�R�R�RuR;RR�RD	R�RRAR=RtR�S�SHSmS-S:SS�S�SS)SmS�SgSxSxSgS�S�SsSoS]S�S�S�S�S�S�S�S�SS�S�SS(S�S�S�N�
N[NNN�NbN�NN�SES\SJOMD�D1D�O�Z�J:MTZT�T�M?C�P�CI�I�I�C1�
ȩȇ��ȀW>W-M�WW>WW�W�Tz����˚�y�*�S�mˊ�f�^G�MWW�M�
M�M�
W]W�MM�	H�
FF�F�G�FmF�O�F�	"S�FF�T�
C�
C�C�T<TQT%TeT�T�TT�T�T�T�T�T�T�T
ThT�TtT�T�TT�T�T�T�TjT&T�T�T�T�TqTT�
WDW�L}C�H�	S-S1SGH�HcWWWW�W�W�W�WdW�WiW�W�WcWD�D#DzDXD=DC	 D�DRDD�	"D�D$DD�D�DeD�D�DlD`DDD�D�D�D�D�	 DG
#D/	DvD)��	�X��
���R
���W
�����XϨ�C	�z	τ	�B	�
�	
�
��
ϵ	϶	�'
�	�	�U	ϥ	�	�Z	Ϫ	����S�S7S5S�S^	S3S�S�
SO�LLNL�L\L�L0L+L�L.L�L:LuL�LSL�L|L�LuL�L�LDL�L�L�L�LHL�L�L.L�L\L�L�L�L�LbL�L�L�L;L�LEL L�L�LuLL�L�L�LiL�L�LHL�L�L�L�L�L�L�LLFL�L�L_LL�L�L�LTLhL�LSL:L�L�L�L�L�L�L�LQLL�L�L�LuL�LvLL�LL�LzLsLC�>�d�J���Q��	�����t�|�G�F���	�4��~�^����	�l���������������u	����)�����w���3����	C�CnC�C�CQCMC�C!CSCRC�C�CC�C�CvC/C�C�C�C{C�C^C�C�C�CC�C;C�CIF[C�C7C9CBCEC2C�CC�C�CkC�C�C�C�C�C�CXC}C�CaC)C�C�C�C�C�C
C�C�C�C C�C�C�C�C�C�CyC~C�C�C�C�C�C�CM M`M�
��ʝʉ���5	�}	�}	����ʒ���B
�R
�t
HnH�HgHTH�H�H6C-C�
C_C+C�CCC�C�C�CCC4C
Ce	Mr	L�INI�I�I�I�I�I�K�K�K�K�KK�KdK�K�KFK�_�_�_%_&__OH�H�HZHjC�CC�C�CYV�
V�
VmVsV�	V�	I@K�F�F�FGF�	!FQP
#F�FCP�F�FiF�F�
P	PYFTF�F�S�S�G�S�DA�h	�/��	�w�d	���
�_	A�� 
�0�������`	�
�7��j�����
���9�6
נ��
���	��	��
���#�-��
��	�����G�U��O����
��dHE��
�-
��	��	��	�~�"
�����	�,�u������	���I��HA�K	_����Z�]��ͤ�I�g�X��
���
��G�[��	͋�
ͨ
�tͤ��
͝͝�b�Z͍�m�f�X��ͱ�a�	�*�,�R͸��	��	ν	�
��	��	θ	�#
���������A����	�H	��	��	��	��F��	�x	��	�Z	��	��	��	�%�X��	��	�������'�����w
��
���
�0��	��
��
��
�	���N͞	��
��
���/�^��
���� �t
�rͤ
��j
�
�%�T��׋�	
����3�Tׄ����5� 
��	�V��D�v�g����������|
�Q������f�a�]ҫ�|�xD�D�DD�D	D�D<D�	D�UEU�U�
U3SFS�
SAS�S\S=S/SXS-�J�������p	�}��ȡȪ�ȭ�V�d��|��ȧ֔֬�+�1����	��	����	�_�C	�!	�L��
��	��
�w	�@�	�	��	����	ȯ	�%��ִȄ��Ȟʨʣ	����	�Q	�X	���
�L	�c	��	ȃ	ֳ	�_�"	�U	����G�G��	��	�
��h	Ȁ	�g�`��	�C	����	��	�G����H�x����]	Ц	�c	�s	ԕ	�q	ʁ	����Ȣ��ȠÄ	Ȥ	��
�!��	��	��	�w	Æ	�ʁ	˼�3	�	��Џ
�t
�����ȵ�f	�K	�X�=��ɭ	����	��Ȳ�d�D
�(ȋ	���֔֗�X�F�g	�H	�e��ђ	��	��	��	ɒ	�	��	��	��	�?	�C	�0	Ȧ��	�j	�s	���%	�������b	��Ȅִ�*	��	�c	�V
ֆ
�UօȦ���6�fȋ���a	����	ȃ	ֳ	��
_q_5
���e�7����v��	_�
�v	������9	�
	�!	ȝȭ�i�~	�R	�3
�	�	�������(���~�(	�n	��>ȃ	ȶ	�]	�|	�	�m�����Ȥ�_������[	�@�Q	�֥�?��@�q	֡	�L	�:	��������F�������������ȳ	Ȓ	���e	��	�|	��	Ȝ	��	�v	AFM�P<P.P%J$CY	RXMoMoM�	A�S�I�Ik	C�S�S�P�P}	P,PtP~	P	P�	P�	Pq	Pv	P�	P�
M�M�M�M�M�M�M�M�M�M�M�M�M�MxM}M�M�M�M�M�M�MxM}M�J� CZ	CR� ADA\A�A�A�A�A�ACq	C]CrC�D	D
DDIj	I�I~	I{I�	I�IIIII/IlIoLt	L�	Ly	L�	LmMmMoMoMM�M�	M�	M�M�M�	M�	MmMpM�	MnMbMqM�M�	M�	M�	M�	M`M�	M�	M�	MoMpM�M�	MoM�M�M�	M�M�N� N.O�
O�P-P/P/P�	S�S�S|SeS�T�T�XtX[���2Ȫ�Z�,�+	�	ȠȶȞ	ύ	���P���!ȃ�2�	���\��Ȧ�(
ʛ
�����^��м�x��Ѕ��?��	��
�e	��
������&	�3	����	�	������	�����L	�c��	�K�T��	��
�����������
��
�Z�Q��	���X	׵�z���xȓ�~�'	��Ȱ�Y
ȷ��
��
�o	�9	�Ȇ	Ȏ	Ȓ���Y	֨ȕ���3	ѡ
ξ�N	�Y	λ��	�	�	�v
�w
�w
ȹ	��	���������*���
֖�H	��Q	�X	�	��	�
���W	�?���	�x�&	���	��	�X	�a	��Ȅ
׆	�1	�:	��	�p	ɦ�^�=�1	�	��	�2��	��m	��l���	�		��	�8	�>	��	�0	��ȯ΃	ξ	Ή	�C	��Ă�����ą��	Ă	�p	�c�\�����G��	Ȧ����	�������j�k֚Ɉ���M���H	Ƚ	Ѓ	�v	�l
�6�@��	�&� �l�X��B	�l	�d	��	��g�k�����w
��
�e�ɞ	������wç�����5	�B	��������	�Q	�D	�	�	�����9	�F	��	ȭ�s�lȌ
�l����ȓȞȯ�	�Z	ײ	Ƞȅ�I	�]	�;	�j	��	�]��Ⱥ
Ȳ�/	���	�e	Ȁ������ʟʉ	��ʿ
���_	�+���
�ȏ�<��ȳ�Z	��	�A��	�d	�/	�`
ȪȽ����Ȫ�WȂP_�#����
�
��	�+	�;	��ȏ���l��ȇ�n��	�>	ȳ	Ⱦ	�n�W
�f�o	�>ȣ����ȴ�[	�:	�T	ѕ	S�R�֒�O	�~	�-	�<	�T	�{	ȶ�Z�+�~�3	ʓ	�j	ȝȋȄ��
�E	�b	�	�k	�b�
	�!�o�|�/	�(	�	�w	ȩȝ	�*
���]��Ȼ���]��ƕ	��a	�-	�	�T	�[	�~	�O	�r	�t	���&	��ȭ�����Z	ʥ	��ȅ�|	�����}ȵ�Fȧ�;	Ȇ	�4	��	��Ȭ	�J	�������������9	ʣ	���J�^���
��
���	�U	������	Ȯ	�4	��Ƞ���������a�b�l�m���S�f	ȣȘ���X	ȋ��×	�d	ȳ�a	�H��
���$���3����@�7�P�@�H���$������}	�����>	�	��	��	Ȱ�H�j�4	�Jȭǃ	�8	�l	�>�l	��k֚����ɨ���e	�D	������Є�w��	�U�-	�	�l	�^	��
��
���.����C���	�$�Ȯ���/C;ChC���	�F�A�S	�=�s	ă	��
��
�z
�Z�~
���x	�B���7����m���}���(���'	�6	�D	��ȋȷ�+�Z�]�	�'	���֐	ע���o	���	��	�"	֦֮��	�yʸ�����	���[	�m	��	��������!����Q	�q	������t	�q	���R���<�E���������˄˛A�A�
A�
AAr	A��t
�t
�sϣ�g��]Ԩ	ԫ	�	׵�#	Ȏ�yȑȱօ�	�z	�K	�	ȃ�\	���]���2�?���E	�	��
��	��ȩ�p	��Ȫ�d�|����֔֬�+��L	�������_�;��	�w	�@�	��	�`	֐	�m������	�3
Ⱥ
�~�o���~���c_ �.�bȷȚ�_.
_`_��xȘ_���ʵ	ʝʵ	���9�V	������Ȏ�=�*����-_ __ �j�1	���]�j֚��	�	�c	�R	��	ȃș�[	ɐ	�6�o	���]���!�P���G�n	�	��	�0�k�X�mΫ��ζ΢�k���θ��λ���2�X�{�4�(�i�b
�Q
�E
�#�D�2������γ
�
�E���	��
Χ
͟�n��3�?ײ������	�'	�R�2ϽϽϴ��
���/
�
��	��	��	�D
�%
�������0�xԤ�����ͷ���u��������͝���	�Z͊���3�tͤ͹�#�,�Ͳ��G��Ϡ��+
��
ΰ
�P
����h���u
͑�`����Y��	��Ψ
��	���P
��
��	���Q
����	�5�k� �����-	���.ς
��	��	�&�<��
��
��	��
����
��
������
�
� 
��
�

�e
��
�A�#�
����	�2��	������	��	��	�
�$��������s
�K
�l
�Μ	Ξ����	ϼ	�Z�Cϊ�[�!���8
���+��
��
��	�#�>��	�\	���
���xς	�oϰ	�8��#
���,Ϯ��	���D�����;ı
�0��
�h
�s
��	�
��
ĥ	��
�DΩ���,���r��������q�a�^����͔��2� �]��ͫ�V͚�`�6	͙�mς���K�zϼ	��	ϟπϞ�����ϭ��������/�_�Z��
ϫ
���R���<
��ʯ�Bʴ
�z���
��
���������I�Tʇʁ�=��
���L�j�d����Խ	�/�e
λ
�[�b�X�
��	��
���
����	���m
���L
��	�,
�l��
Ġ
͗
�c��
ͻ	͎
͛��
��	��
�-�~
�F
�U�e��P��������	�z�h	���4Ύ�q	�9Έ
�h���a	�K͑��	�D� �(�� �j�N���@ͮͩ�͑������ ��
��ς����Ϻ
��
ω
�,��
��
��ŪŜ�������'�OU	O{	ϛ
���}��Ħ
������N��
�:Σ
μ
�*�G�h
�Z
Ϥ
�?	�$ϔϚ�{
��
�����Z̀��
�5
�F��έ
��V͕�����s�������ͯ�&	�L�`�������
��d��Ȼ��|���iA�Al
� ��	̀��	�7�t�~��`�Y�$ʋ
�5�9�*�?ʬ������ʴ���������=��	��	Ě
Ҍϰ���o�
�L��������	ϥ
���@����Ϯ	ω�	�0���ͥ�q��i�D��}��	��
�VϬ��
��	�h	ϥ
��	ϩ
��	�mֈ֝� 
Ď	��δ�x
κ
��
·�����-�?��̀�	�KϷ��
Ο�,��R�R�ȭ�N�s	��	�m�-�ϰ�=
�EEEm�
̀����6ײI�I����͙!���H�n�s
�X��Nγ	�����	�Z	�T�����x
υ
��
����	ͿϿ��	�
���������.��	�o�m�����U��ϼ��g�c	��	��	�,
΅�`
č	���U�`���a
�P	�&Ͼ��
�2
��
���	��
��
�u�E��
͕�k �.�-�R	ͨ
��	��	�w	���
���`�n�����W�W�S�S������'
�A�A�>�>�=�=�a�/	�u	�/	�u	�N����л�	кио��2��	��	ϲʸ��I�I����!Ή��ʼ
�v
ʽ
ʧ
�P�A��	�	
Ν
��	�g
����c���s�LC,CeC�C?C2C'C��b�x��0�9���	�������0�����-
Β
�G
�N�v�Q�z�*ϦϚψ��	�_��	��	��
�����N�I��ׁ	�
��	׬	ג	�L	�4�6�6��	�a���
���Ț	�	��	���Ϸ�:�
Ͷ͊ͤ��ʘ��	����
�����Ύ
Ξ
ͿC�
�@Ϝ
ΣҎ
��
Һ
�υϟ	��΅��	��	ħ
�φ
�1�ϲ	ϵ�����	��	�����$
ʌ�|	��P	���������3΅��
�'�N�!��ʇʫʘ	��
�	�s���	�
��
��
η���?�<ֶ����͆�y�$�T�����Xͻ
r�	rm	r�
r�ʱ�g
�	�������

�f��	׽	�o
��	�p�y�i�n�1	�A	A��3�i����
�8�
���)����P�L�6���J׾��H�
������j�iϽ
�'�C����������:ҍ
��
����
������z
��
�$������	� �	
�#�+�,�:��	���������A��-���d֎�T�cւ֢���8_�_�C�S ����	Ⱦ	ȴ	�b����ϭ��
�3ʕ
�ĳ������	��	��
�U����
�����8
ʁ
ι�V_z
�d�έ����L��	����	�_�YΔ�����
�����������Ƚ�K�d���	ȸ�������j��
�Υ	�N��Ϥ��	�G��
�M	Ή	�d�cΔ	�͍�lΡ�j��Μ����	��	��	�l�g	�C	Ȥ�/
�%
�=���"� ��	���J�|�X������͖
�d
͓	�	�1	���Q
͂��͊�3��9��͙	��B�~	��_�����4
�	�;����Q�Z͕��	͍
�1����	��	�F���'�4
����
�^�D͑	ν��	�c�e����ͻͣ�Ir�΄ʾ
�r
BB�B���	��� ���2�@�������rM�?���K�c�w���f��
r���
��
�=	�=	�����gʤ�����
���������S�ʀ���r�|�������UͥϨ�φ
ς
�8
�b
��
�����}���l
�*��ͱ_�_�_�_"�V���}����������Ą�����T	�;	�J�p��	��Ĕ���<�e��j�3�3�i
�X
�U�@�J���ɻ��	b�h������>�Y���1
�(�c��]������	����	�����7
�m��	��	��	��δ�&_=_1�q
�ώ��	Ħ��
�g
�v
�����-
΃�,�lδ�9΃
L�H�L�H���	Ę	ά
�U
�
����� �`�#�	ν	����
���F6ΆV6ζ�����]ς��P�)��
�����C���vG[�� ���?A�Χ
�p�
���ϣ���%
�H���9ϐ�S�C�2�r�$�O4ʍ�n���D
�	�`��	�4
�g��	�����ʖ�
�=��/��>
�fϽϖ��E0G;SG�E϶���_���i���=���W���V�&�S�Φ
�O
���[���C��V�V�L��	�y	�J�%Ie�������w� �c�w�p�G�G�� ҇SR����ϱϖϭϺ�c�!��f���H_���VIQIL)HW	ʭ	ʽ�Zα�[t�
��
��
��2�2�	�R�n�`�~�Y�����?��	������	�%�-	��	�  (	   -  �  > �
 �  �  �  �  ��   ��  .<        !   ,   5   C   M   ]   m   {   �   �   �   �   �   �   �   �   �     %  *  0  5  <  C  L  U  \  e  o  x  �  �  �  �  �  �  �  �  �  �  �  �  �  �             !  )  3  <  E  O  X  b  i  q  x  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        #  4  <  D  K  U  ^  h  q  y  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        %  3  =  G  Q  V  [  _  e  l  w  �  �  �  �  �  �  �  �  �       ,  G  ^  l  ~  �  �  �  �  �  �  �  �  �  �  �  �  �  �        !  1  4  9  F  R  X  Z  \  e  n  w  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �            %  .  5  >  G  P  Y  `  i  r  {  �  �  �  �  �  �  �  �  �  �  �      '  7  T  ]  `  e  j  u  z    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  	  	  	  '	  0	  ;	  D	  K	  T	  ]	  f	  m	  x	  }	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  
  
  $
  )
  -
  1
  8
  ?
  D
  I
  R
  ]
  j
  x
  
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
         &  5  B  M  T  f  m  v  }  �  �  �  �  �  �  �  �  �  �  �  �            !  &  +  0  5  B  G  L  R  U  X  f  o  x  �  �  �  �  �  �  �  �  �  �  �  �  �        -  6  ;  @  K  V  a  l  y  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �         2  =  J  T  ^  e  j  o  {  ~  �  �  �  �  �  �  �  �  �  �  �  �  �         *  :  ?  E  K  Q  W  f  s  ~  �  �  �  �  �  �  �  �  �        1  9  B  J  W  e  n  w  �  �  �  �  �  �  �  �  �  �  �  �  	    '  6  B  L  W  `  k  u  �  �  �  �  �  �  �  �  �  �          %  9  B  K  P  W  `  i  r  y  �  �  �  �  �  �  �  �  �  �  �  �  �  �        "  '  ,  1  8  A  I  Q  Z  q  |  �  �  �  �  �  �  �  �  �  �  �  �  �  �          (  6  G  X  i  x  �  �  �  �  �  �  �  �  �  �        #  2  ;  @  I  a  l  s  |  �  �  �  �  �  �  �  �  �  �  �     	    $  .  5  <  H  Q  ]  b  g  n  |  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �             #  7  D  P  c  t  �  �  �  �  �  �  �  �  �  �    '  :  S  m  �  �  �  �  �  �  �  �  �      (  :  L  g  |  �  �  �  �  �  �  �       +  N  m  �  �  �  �  �      3  @  Q  ]  m  �  �  �  �  �  �  �    $  >  M  [  r  �  �  �  �  �  �  �  �      (  6  C  O  V  ^  e  v  �  �  �  �  �  �  �  �  �  �  �  �  �  �         !  ;  S  j  y  �  �  �  �  �  �  �        )  9  C  O  \  h  w  �  �  �  �  �  �        *   ;   I   [   l   �   �   �   �   �   �   �   �   �   �   !  !  !  &!  1!  <!  C!  R!  ^!  l!  {!  �!  �!  �!  �!  �!  �!  �!  
"  "  *"  >"  M"  Z"  k"  "  �"  �"  �"  �"  �"  �"  �"  �"  #  &#  8#  N#  ^#  n#  |#  �#  �#  �#  �#  �#  $  $  )$  =$  W$  s$  }$  �$  �$  �$  �$  �$   %  %  #%  I%  h%  v%  %  �%  �%  �%  �%  �%  �%  &   &  9&  T&  o&  �&  �&  �&  �&  �&  �&  '  $'  1'  C'  T'  g'  |'  �'  �'  �'  �'  �'  �'  �'  �'  (  (  +(  5(  C(  O(  Y(  f(  w(  �(  �(  �(  �(  �(  �(  �(  �(  �(  )  )  ))  C)  P)  [)  e)  u)  �)  �)  �)  �)  �)  �)  �)  �)  �)  *  *  (*  :*  M*  Y*  d*  u*  �*  �*  �*  �*  �*  �*  �*  �*  +  +  1+  G+  \+  q+  �+  �+  �+  �+  �+  �+  �+  �+  �+  	,  ",  ;,  H,  S,  `,  l,  |,  �,  �,  �,  �,  �,  �,  �,  �,  �,   -  	-  -  #-  --  6-  A-  L-  V-  ]-  j-  ~-  �-  �-  �-  �-  �-  �-  �-  �-  �-   .  .  .  %.  ..  ?.  T.  b.  o.  |.  �.  �.  �.  �.  �.  �.  �.  �.  /  /  3/  H/  ^/  r/  �/  �/  �/  �/  �/  �/  �/  0  0  +0  B0  Q0  b0  s0  �0  �0  �0  �0  �0  �0  �0  �0  �0  1  1  31  A1  Q1  a1  o1  �1  �1  �1  �1  �1  �1  �1  �1  2  "2  12  I2  X2  f2  x2  �2  �2  �2  �2  �2  �2  �2  �2  �2  3  3  $3  /3  >3  J3  \3  m3  |3  �3  �3  �3  �3  �3  �3  �3  �3  �3  4  4  94  N4  c4  4  �4  �4  �4  �4  �4  �4  �4  �4  5  5  5  (5  75  ?5  I5  Z5  m5  �5  �5  �5  �5  �5  �5  �5  �5  �5  �5  �5  �5  
6  6  +6  86  K6  `6  t6  �6  �6  �6  �6  �6  �6  7  !7  .7  ;7  F7  V7  b7  p7  �7  �7  �7  �7  �7  �7  �7  �7  �7  �7  8  18  F8  \8  g8  y8  �8  �8  �8  �8  �8  �8  �8  9  9  %9  49  F9  W9  g9  �9  �9  �9  �9  �9  �9  �9  �9  :  ":  8:  P:  h:  ~:  �:  �:  �:  �:  �:  �:  �:  ;  ;  #;  3;  @;  X;  k;  };  �;  �;  �;  �;  �;  <  <  2<  D<  V<  l<  }<  �<  �<  �<  �<  �<  �<  �<  =  =  ,=  :=  J=  T=  b=  {=  �=  �=  �=  �=  �=  �=  �=  �=  >  >   >  ;>  V>  k>  �>  �>  �>  �>  �>  �>  �>  �>  ?  !?  5?  I?  Y?  l?  �?  �?  �?  �?  �?  �?  �?  �?  @  @  0@  B@  P@  ^@  u@  �@  �@  �@  �@  �@  �@  �@  �@  
A  A  4A  GA  ^A  xA  �A  �A  �A  �A  �A  �A  �A  B  #B  3B  AB  RB  `B  xB  �B  �B  �B  �B  �B  �B  C  /C  IC  aC  uC  �C  �C  �C  �C  �C  �C  �C  �C  �C  D  D  D  &D  9D  LD  aD  zD  �D  �D  �D  �D  �D  �D  �D  �D  �D  E  E  !E  *E  7E  BE  OE  \E  mE  wE  E  �E  �E  �E  �E  �E  �E  F  F  #F  9F  OF  iF  zF  �F  �F  �F  �F  �F  �F  �F  �F  �F  �F  �F  �F  G  G  *G  <G  NG  `G  rG  �G  �G  �G  �G  �G  �G  �G  H  H  4H  NH  dH  yH  �H  �H  �H  �H  �H  I  I  0I  FI  XI  oI  �I  �I  �I  �I  �I  �I  J  J  .J  CJ  XJ  lJ  �J  �J  �J  �J  �J  �J  �J  K  K  +K  >K  RK  cK  }K  �K  �K  �K  �K  �K  �K  L  #L  6L  LL  \L  oL  �L  �L  �L  �L  �L  �L  M  M  .M  AM  WM  oM  �M  �M  �M  �M  �M  �M  �M  
N  N  (N  9N  MN  bN  xN  �N  �N  �N  �N  �N  �N  �N  �N  O  O  O  O  O  8O  FO  RO  jO  �O  �O  �O  �O  �O  �O  P  -P  LP  aP  �P  �P  �P  �P  Q  Q  8Q  MQ  fQ  �Q  �Q  �Q  �Q  �Q  R  7R  OR  _R  mR  �R  �R  �R  �R  �R  �R  �R  �R  	S  S  'S  7S  GS  SS  iS  uS  S  �S  �S  �S  �S  �S  �S  T  T  !T  1T  @T  QT  aT  sT  �T  �T  �T  �T  �T  �T  �T   U  U  U  %U  3U  AU  LU  WU  gU  tU  ~U  �U  �U  �U  �U  �U  �U  �U  �U  �U  �U  V  V  V  #V  1V  =V  MV  XV  fV  xV  �V  �V  �V  �V  �V  �V  �V  �V  W  2W  HW  _W  uW  �W  �W  �W  �W  �W  �W  X  !X  -X  :X  QX  aX  xX  �X  �X  �X  �X  �X  �X  �X  �X  Y  Y  )Y  7Y  EY  SY  aY  pY  �Y  �Y  �Y  �Y  �Y  �Y  �Y  Z  9Z  YZ  eZ  qZ  }Z  �Z  �Z  �Z  �Z  �Z  �Z  �Z  �Z  �Z  [  [  ![  -[  9[  E[  S[  _[  m[  y[  �[  �[  �[  �[  �[  �[  �[  �[  �[  �[  
\  \  *\  @\  S\  c\  u\  �\  �\  �\  �\  �\  �\  �\  �\  ]  ]  )]  9]  L]  ^]  o]  �]  �]  �]  �]  �]  �]  �]  �]  �]  ^  )^  4^  G^  Y^  k^  z^  �^  �^  �^  �^  �^  �^  �^  �^  �^  �^  _  _  #_  3_  G_  U_  a_  p_  {_  �_  �_  �_  �_  �_  �_  �_  `  '`  =`  S`  i`  `  �`  �`  �`  �`  �`  �`  a  a  a  *a  6a  Ba  Ka  [a  da  �a  �a  �a  �a  �a  b  b  2b  Mb  gb  �b  �b  �b  �b  �b  c  &c  Bc  ac  yc  �c  �c  �c  	d  d  5d  Ad  Pd  \d  ed  od  �d  �d  �d  �d  �d  �d  e  e  'e  /e  ;e  Me  ^e  le  {e  �e  �e  �e  �e  �e  �e  �e  �e  f  f  (f  /f  9f  Ff  Rf  af  mf  yf  �f  �f  �f  �f  �f  �f  �f  �f  �f  g  g  +g  ;g  Ug  ]g  gg  tg  �g  �g  �g  �g  �g  �g   h  h  h  $h  4h  Bh  Sh  _h  mh  |h  �h  �h  �h  �h  �h  �h  �h  �h  �h  �h  �h  �h  �h  �h  i  	i  i  i  i  1i  Ai  Ri  ci  ii  xi  �i  �i  �i  �i  �i  �i  �i  �i  �i  j  j  #j  6j  Dj  Uj  hj  yj  �j  �j  �j  �j  �j  �j  �j  �j  k  k  k  .k  =k  Lk  `k  vk  �k  �k  �k  �k  �k  �k  l  l  -l  Bl  Wl  ll  �l  �l  �l  �l  �l  �l  �l  m  !m  2m  Cm  Tm  fm  xm  �m  �m  �m  �m  �m  �m  �m  �m  �m  �m  �m  n  n   n  -n  ;n  Dn  Rn  \n  fn  on  xn  �n  �n  �n  �n  �n  �n  �n  �n  �n  o  o  /o  Eo  [o  lo  }o  �o  �o  �o  �o  �o  �o  �o  �o  �o  p  p  p  /p  ?p  Rp  gp  tp  �p  �p  �p  �p  �p  �p  �p  �p  q  q  q  (q  7q  Fq  Sq  dq  sq  �q  �q  �q  �q  �q  �q  �q  �q  r  (r  ?r  Sr  cr  vr  �r  �r  �r  �r  �r  �r  �r  �r  	s  s  $s  0s  Bs  Ts  gs  zs  �s  �s  �s  �s  �s  �s  �s  �s  	t  t  0t  Bt  Ut  gt  yt  �t  �t  �t  �t  �t  �t  u  u  .u  Au  Tu  iu  u  �u  �u  �u  �u  �u  �u  v  v  /v  Gv  ]v  nv  �v  �v  �v  �v  �v  �v  w  w  .w  Ew  ]w  uw  �w  �w  �w  �w  �w  �w  
x  x  4x  Ix  dx  {x  �x  �x  �x  �x  �x  	y  #y  7y  Py  fy  {y  �y  �y  �y  �y  �y  �y  z  (z  :z  Pz  fz  |z  �z  �z  �z  �z  �z  {  {  2{  I{  f{  �{  �{  �{  �{  �{  �{   |  |  .|  C|  [|  e|  q|  }|  �|  �|  �|  �|  �|  �|  �|  }  }  0}  F}  `}  p}  �}  �}  �}  �}  �}  �}  �}  �}  �}  ~  ~  0~  B~  W~  e~  w~  �~  �~  �~  �~  �~  �~  �~  �~  �~  �~      *  B  Z  r  �  �  �  �  �  �  �  �  �  �  �  &�  5�  B�  P�  Y�  c�  ~�  ��  ��  ��  Ȁ  ـ  �  	�   �  ;�  Y�  c�  m�  ��  ��  ��  ��  ȁ  ؁  �  ��  �  �  )�  :�  J�  Z�  j�  �  ��  ��  ��  ��  ͂  ۂ  ��  �  �  �  /�  B�  Q�  a�  v�  ��  ��  ��  ��  ��  ��  ԃ  �  �  ��  �  �  "�  /�  >�  L�  ^�  o�  ��  ��  ��  ��  ��  Ʉ  ڄ  �  ��  �  �  $�  A�  [�  t�  ��  ��  ą  ߅  �  �  1�  <�  S�  d�  t�  ��  ��  ��  ��  І  �  ��  �  �  8�  X�  {�  ��  ��  ͇  ۇ  �  �  ��  �  �  �  -�  :�  I�  Y�  k�  ~�  ��  ��  ��  ͈  �  ��  �  $�  ;�  M�  _�  r�  ��  ��  ��  ��  ̉  މ  �  �  ��  	�  �  �  '�  1�  9�  G�  _�  k�  �  ��  ��  ��  ��  Պ  �  ��  �  �  (�  7�  O�  b�  v�  ��  ��  ��  ɋ  �  ��  �  �  #�  4�  E�  W�  n�  ��  ��  ��  ��  ƌ  ٌ  �  ��  �  $�  8�  N�  c�  x�  ��  ��  ��  Í  Ӎ  �  �  ��  �  "�  2�  H�  X�  o�  ��  ��  ��  ��  ��  ю  �  �  �  �  <�  M�  \�  o�  ��  ��  ��  ��  ŏ  ֏  �  ��  �   �  6�  K�  ^�  o�  �  ��  ��  ��  ��  ɐ  Ԑ  �  ��  �  '�  7�  G�  W�  o�  ��  ��  ��  ��  ϑ  �  ��  �  �  -�  A�  S�  e�  y�  ��  ��  ��  ��  ϒ  �  �  �  �  )�  7�  I�  ]�  q�  ��  ��  ��  ē  ԓ  �  ��  �  �  �  *�  =�  I�  V�  o�  ��  ��  ��  ��  Ô  Ԕ  �  �   �  �  �  -�  =�  J�  ]�  k�  |�  ��  ��  ��    ҕ  �  ��  	�  �  '�  6�  E�  T�  d�  r�  �  ��  ��  ��  ��  і  ޖ  �  ��  �  �  -�  C�  X�  v�  ��  ��  ��  ��  ї  �  ��  �  �  .�  <�  I�  ]�  n�  |�  ��  ��  ��  ܘ  �  
�  "�  3�  E�  M�  Y�  c�  s�  ��  ��  ��  ��  ʙ  ܙ  �  ��  �  �  ,�  A�  O�  ]�  w�  ��  ��  ��  ʚ  �  �  ��  �  �  �  �  (�  /�  :�  E�  M�  U�  d�  s�  |�  ��  ��  ��  ��  ʛ  ޛ  �  	�  $�  4�  D�  T�  b�  t�  ��  ��  ��  ��  ǜ  ۜ  �  �  �  %�  :�  M�  [�  k�  w�  ��  ��  ��  ��  Н  �  �  ��  �  �  �   �  /�  ?�  ]�  j�  ��  ��  ��  ڞ  �  ��  �  �  %�  3�  =�  \�  h�  t�  ��  ��  ��  ş  ҟ  ݟ  �  �  ��  
�  �  �  *�  9�  B�  M�  Z�  e�  u�  |�  ��  ��  ��  ��  ��  ��  ˠ  ٠  �  �  �  ��  �  �  �  *�  6�  D�  N�  Z�  b�  j�  v�  ��  ��  ��  ��  ��  ϡ  ס  �  �  ��  �  �   �  *�  8�  F�  T�  b�  r�  |�  ��  ��  ��  ��  ɢ  Т  ܢ  �  ��  �  �  �  $�  8�  ?�  O�  T�  f�  z�  ��  ��  ��  ��  ��  ţ  ѣ  ݣ  �  ��  	�  �  !�  -�  9�  C�  S�  c�  s�  ��  ��  ��  ��  ä  Ӥ  �  �  �  �  )�  9�  I�  W�  e�  s�  ��  ��  ��  ��  ��  ˥  ݥ  �  �  �  %�  7�  E�  S�  a�  o�  }�  ��  ��  ��  ��  æ  Ѧ  ߦ  ��  ��  �  �  %�  3�  ?�  K�  W�  c�  o�  {�  ��  ��  ��  ��  ŧ  ӧ  �  �  �  �  #�  3�  C�  Q�  a�  q�  }�  ��  ��  ��  ��  ��  è  Ϩ  ۨ  �  ��  ��  �  �  !�  -�  9�  E�  W�  e�  u�  ��  ��  ��  ��  ѩ  �  ��  	�  �  #�  /�  ;�  G�  S�  e�  w�  ��  ��  ��  ��  ��  ɪ  ժ  �  �  �  �  !�  1�  A�  L�  W�  b�  m�  x�  ��  ��  ��  ��  ��  ��  ī  Ы  ܫ  �  �  ��  
�  �  "�  .�  :�  L�  `�  t�  {�  ��  ��  ��  ��  ��  Ŭ  ֬  �  ��  ��  �  �  �  &�  1�  <�  H�  S�  \�  j�  o�  x�  }�  ��  ��  ��  ��  ��  ��  ��  ��  ȭ  խ  �  ��  ��  ��  
�  �   �  +�  6�  A�  L�  Y�  d�  s�  ��  ��  ��  ��  ��  ��  ��  Į  Ѯ  ޮ  �  ��  �  �  !�  ,�  7�  @�  M�  [�  f�  o�  |�  ��  ��  ��  ��  ��  ȯ  կ  �  �  ��  �  �  �  &�  /�  8�  A�  J�  S�  \�  e�  p�  {�  ��  ��  ��  ��  ��  ��  Ȱ  Ѱ  ߰  ��  ��  ��  
�  �  �  #�  ,�  7�  A�  K�  V�  a�  l�  w�  ��  ��  ��  ��  ��  ñ  ұ  ۱  �  �  �  ��  
�  �  �  %�  ,�  7�  B�  M�  Z�  g�  v�  ��  ��  ��  ��  ��  ��  ��  Ȳ  ղ  ޲  �  �  ��  �  �  �  #�  *�  3�  :�  A�  H�  Q�  f�  q�  |�  ��  ��  ��  ��  ��  ȳ  ӳ  ڳ  �  �  ��  �  �  $�  /�  6�  ?�  L�  Y�  c�  o�  }�  ��  ��  ��  ��  ��  ��  ��  ��  ô  ȴ  ʹ  Ҵ  ۴  �  ��  ��  �  �  �  (�  7�  D�  Q�  b�  g�  l�  w�  |�  ��  ��  ��  ��  ��  ��  ͵  ڵ  �  �  ��  �  �  !�  ,�  =�  J�  _�  j�  u�  ~�  ��  ��  ��  ��  ��  ж  �  �  ��  �  �  �  #�  5�  G�  [�  m�  }�  ��  ��  ��  ��  ÷  з  ݷ  �  ��  �  �  �  )�  6�  C�  O�  [�  g�  o�  w�  �  ��  ��  ��  ��  ��  θ  ۸  �  �  ��  �  �   �  )�  1�  7�  @�  I�  R�  [�  d�  m�  v�  ��  ��  ��  ��  ��  ��  ι  ۹  �  ��   �  �  �  $�  0�  <�  H�  T�  `�  l�  x�  ��  ��  ��  ��  ��  ��  ��  ��  ʺ  ֺ  �  �  ��  
�  �  $�  -�  9�  E�  R�  Z�  b�  j�  r�  {�  ��  ��  ��  ��  ��  ��  Ļ  ̻  Ի  ܻ  �  ��  
�   �  6�  L�  R�  ^�  j�  v�  ��  ��  ��  ż  ռ  �  ��  �  �  )�  ?�  K�  W�  c�  o�  ��  ��  ��  ǽ  ӽ  �  ��  �  !�  -�  9�  O�  [�  g�  w�  ��  ��  ��  ��  ��  ��  ξ  ־  ޾  �  �  ��  	�  �  !�  .�  ;�  I�  U�  a�  f�  k�  r�  ��  ��  ��  ��  ��  ��  ��  ��  ��  Ŀ  Ͽ  Կ  ۿ  �  �  ��  ��  �  �  �  )�  0�  7�  <�  C�  J�  Q�  Y�  `�  g�  o�  x�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  #�  /�  =�  I�  N�  \�  f�  k�  p�  {�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  #�  *�  3�  ;�  C�  M�  T�  c�  r�  �  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  %�  2�  =�  F�  S�  \�  f�  p�  �  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   �  	�  �  �   �  +�  8�  C�  P�  ]�  d�  m�  t�  }�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �   �  .�  3�  A�  F�  O�  T�  [�  f�  t�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  
�  �   �  +�  8�  E�  N�  S�  X�  c�  j�  u�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  &�  4�  ?�  D�  Q�  \�  g�  y�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  &�  3�  >�  K�  Z�  g�  n�  u�  |�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  &�  -�  4�  C�  N�  Y�  `�  k�  v�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  �  ,�  5�  @�  V�  p�  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  -�  8�  C�  L�  Y�  h�  u�  ~�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  
�  �  $�  1�  >�  G�  X�  i�  z�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  !�  ,�  7�  @�  I�  R�  [�  p�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  �  )�  2�  ?�  L�  U�  Z�  c�  h�  s�  ~�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  #�  ,�  5�  >�  G�  P�  Y�  b�  m�  v�  }�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  	�  �  �  &�  /�  <�  G�  T�  a�  l�  q�  v�  }�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  �  )�  2�  =�  D�  K�  P�  U�  \�  c�  n�  u�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   �  
�  �  �  !�  0�  <�  J�  O�  T�  a�  f�  k�  p�  u�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  !�  .�  5�  B�  Q�  ]�  d�  o�  z�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  1�  <�  H�  W�  f�  q�  |�  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  .�  ;�  F�  O�  \�  f�  p�  z�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   �  	�  �  �  "�  '�  ,�  1�  6�  ?�  D�  O�  \�  g�  r�  �  ��  ��  ��  ��  ��  ��  ��  ��  ��  	�  �  �  (�  5�  >�  G�  R�  ]�  h�  s�  ~�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  ,�  8�  H�  X�  p�  |�  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  .�  C�  X�  ]�  f�  o�  |�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  �  �  �  &�  /�  >�  K�  R�  Y�  b�  m�  x�  �  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  #�  0�  =�  O�  c�  u�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  -�  D�  Y�  c�  n�  u�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  #�  1�  =�  I�  Y�  [�  b�  k�  r�  w�  ~�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  �  �   �  -�  ;�  I�  U�  e�  u�  ��  ��  ��  ��  ��  ��  	�  �  5�  K�  [�  k�  �  ��  ��  ��  ��  ��  ��  ��  ��  
�  &�  6�  H�  Z�  l�  v�  ��  ��  ��  ��  ��  ��  ��  ��  ��  
�  �  6�  N�  j�  z�  ��  ��  ��  ��  ��  ��  ��   �  �   �  .�  <�  J�  X�  f�  t�  ��  ��  ��  ��  ��  ��  ��  ��  �  $�  8�  L�  `�  t�  ��  ��  ��  ��  ��  ��  �  �  0�  F�  \�  l�  ��  ��  ��  ��  ��  ��  ��  �  �  &�  0�  :�  D�  P�  `�  p�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  !�  +�  5�  C�  Y�  c�  u�  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  �  *�  <�  L�  V�  `�  m�  w�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  +�  9�  K�  Y�  e�  s�  �  ��  ��  ��  ��  ��  ��  ��  �  �  *�  4�  >�  H�  X�  f�  r�  ��  ��  ��  ��  ��  ��  ��  ��  �  �  (�  :�  L�  ^�  l�  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  "�  4�  B�  W�  c�  u�  ��  ��  ��  ��  ��  ��  ��  �  �  �  '�  :�  N�  ^�  l�  v�  ��  ��  ��  ��  ��  ��  ��  �  �  *�  <�  L�  \�  l�  ��  ��  ��  ��  ��  ��  ��  �  ,�  D�  \�  r�  �  ��  ��  ��  ��  ��  ��  �  �  $�  8�  L�  `�  r�  ��  ��  ��  ��  ��  ��  ��  ��  �  �   �  2�  B�  N�  \�  l�  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  $�  4�  D�  P�  d�  n�  ��  ��  ��  ��  ��  ��  ��  ��  �  �  0�  @�  P�  Z�  h�  r�  ~�  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �  $�  .�  @�  J�  X�  b�  t�  ��  ��  ��  ��  ��  ��  ��  ��  �  �  !�  3�  E�  W�  i�  }�  ��  ��  ��  ��  ��  ��  ��  ��  �  �  5�  M�  [�  r�  ��  ��  ��  ��  ��  �  !�  ;�  O�  c�  {�  ��  ��  ��  ��  ��  ��  �  �  /�  ?�  O�  Y�  c�  m�  �  ��  ��  ��  ��  ��  ��  ��  �  #�  8�  M�  V�  _�  i�  }�  ��  ��  ��  ��  ��  ��  ��  �  �  '�  1�  ;�  K�  W�  g�  w�  ��  ��  ��  ��  ��  ��  ��  ��   �  �  ,�  6�  D�  b�  ��  ��  ��  ��  ��  ��  ��  ��  �   �  2�  D�  X�  f�  z�  ��  ��  ��  ��  ��  ��  ��  �  "�  6�  H�  \�  n�  ��  ��  ��  ��  ��  ��  ��  ��  
�  �  *�  >�  R�  ^�  o�  �  ��  ��  ��  ��  ��  ��  ��  	�  �  )�  :�  N�  `�  n�  |�  ��  ��  ��  ��  ��  ��  ��  ��  �  $�  3�  B�  S�  f�  y�  ��  ��  ��  ��  ��  ��  ��      3  I  Y  i  {  �  �  �  �  �  �  �    
  " 0 D R ` n | � � � � � � � � �  , @ N ^ m w � � � � � � � � �   + 9 M W g x � � � � � � � 
  , > _ u � � � � � � �   ( 6 K R ` q � � � � � � � � 
  # 5 E S g s � � � � � � �   ' 5 I S a s  � � � � � � �   
  ( 2 < H T ^ j � � � � � � � � 	 	 5	 E	 U	 e	 u	 �	 �	 �	 �	 �	 �	 �	 
 
 (
 B
 \
 o
 �
 �
 �
 �
 �
 �
 �
 �
   # 3 > I T ` m { � � � � � � �   - B T e w � � � � � � � � �    * > O Z m x � � � � � � � �   " . @ L \ l | � � � � � � � � �   * @ N \ j x � � � � � � �    , : H V n z � � � � � � � �   " 0 > N ^ p � � � � � � � � �    * ; N X h r | � � � � � � � �   ) 9 K Y g s  � � � � � � � � �   , = N b r | � � � � � � � � �   ( 6 @ P b t � � � � � � � �    2 M W ` i z � � � � � � � � 
  & 6 D X l z � � � � � � � � �   : T ` l x � � � � � � � �    + 7 G W g u � � � � � � � � �   - 7 G Y e q  � � � � � �    , 7 F R ^ j | � � � � � � 
  % + 6 B N \ j x � � � � � � � 	 " 6 H V d t � � � � � � �    ! 2 F W k  � � � � � � �   1 E W o � � � � � � � 
    0  B  V  p  �  �  �  �  �  �  �  �  ! ! .! <! J! ^! l! w! �! �! �! �! �! �! " " +" 9" I" R" [" n" |" �" �" �" �" �" �" �" �" #  # 9# Q# i# s# }# �# �# �# �# �# �# �# �# �# $ $ $ +$ =$ M$ [$ m$ �$ �$ �$ �$ �$ �$ �$ �$ %  % +% 9% C% Y% m% {% �% �% �% �% �% �% �% & & #& 1& G& U& j& z& �& �& �& �& �& �& �& ' '  ' /' >' V' d' v' �' �' �' �' �' �' �' ( %( >( N( `( p( �( �( �( �( �( �( �( �( ) $) 0) @) L) `) t) �) �) �) �) �) �) �) * * '* 4* F* V* n* }* �* �* �* �* �* �* �* �* 
+ + ++ <+ M+ ]+ s+ �+ �+ �+ �+ �+ �+ �+ �+ ,  , ,, 8, I, Z, e, w, �, �, �, �, �, �, �, - - *- 7- J- ^- q- �- �- �- �- �- �- �- �- �- . . . 2. E. X. k. ~. �. �. �. �. �. �. �. / #/ 6/ D/ V/ h/ x/ �/ �/ �/ �/ �/ �/ �/ �/ 
0 0 +0 ?0 M0 a0 r0 �0 �0 �0 �0 �0 �0 �0 �0 �0 1 1 1 %1 ,1 31 B1 P1 _1 m1 x1 �1 �1 �1 �1 �1 �1 �1 �1 �1 2 !2 72 D2 Z2 g2 }2 �2 �2 �2 �2 �2 �2 
3 3 %3 83 J3 `3 s3 �3 �3 �3 �3 �3 �3 �3 
4 4 /4 E4 \4 k4 �4 �4 �4 �4 �4 �4 5 '5 25 H5 W5 k5 �5 �5 �5 �5 �5 �5 �5 �5 �5 6 6 '6 >6 R6 b6 r6 �6 �6 �6 �6 �6 �6 �6 7  7 27 M7 h7 �7 �7 �7 �7 �7 �7 8 8 ,8 >8 S8 e8 w8 �8 �8 �8 �8 �8 �8 �8 9 9 '9 89 H9 ^9 s9 �9 �9 �9 �9 �9 �9 �9 �9 : $: 9: J: ^: j: |: �: �: �: �: �: �: �: ; #; 3; D; Z; q; }; �; �; �; �; �; �; �; �;  < < < $< B< X< r< �< �< �< �< �< �< = .= L= W= p= ~= �= �= �= �= �= �= __HIDDEN_TEMP_MOD__ V8���Գ�ʼ�� V8�������� V8JS���� JV����_δ���� JV����_�� JV����_˫������ JV����_�������� JV����_�߼��� JV����_�ı��� JV����_���� JV����_���� JSON_OK JSON_ERROR JSON_INVALIDARG JSON_MEMORY JSON_INVALIDNAME JSON_OBJECTPARENT JSON_INVALIDVALUE zyJsonValue __HIDDEN_TEMP_MOD__ ���� ����W ���� ȡָ�� ��ָ�� �������� �������� ������ �����߼� �����ı�W �����ı� ����˫���� ���������� ����W ���� ���ı�W ���ı� ȡ���� ȡ����W ȡ�� ȡ��W ȡ��Ա�� ȡ��Ա��W ���� �Ƴ�����W �Ƴ����� �Ƴ���Ա �Ƴ���ԱW ��� ���W ������ ������W ȡ���� ȡ����W ȡ������W ȡ������ ���ӳ�Ա ���ӳ�ԱW �����Ա �����ԱW ȡ��Ա ȡ��ԱW �ó�Ա �ó�ԱW �Ƿ����W �Ƿ���� ѡ�� ѡ��W �ö��� �ö���W ������ ������W ���ı� ���ı�W �ÿ�W �ÿ� ���߼�W ���߼� ��˫����W ��˫���� �ó�����W �ó����� ������W ������ ȡԴ���� ȡԴ����W ȡ�ı� ȡ�ı�W ȡ�߼�W ȡ�߼� ȡ˫����W ȡ˫���� ȡ������W ȡ������ ȡ����W ȡ���� ȡ����������W ȡ���������� ȡ����ֵW ȡ����ֵ ����W ���� �������W ������� ����W ���� �ϲ�W �ϲ� �ϲ����� �ϲ����� ��������W �������� zyA2W zyW2A zyToUnicodeString ����_��ͷ��ʽ ��_������ ��_�ı�ɫ ��_����ɫ RECT left top right bottom ���������� ���������ݸ�ʽ �ı������� �ֽڼ����� �ֽڼ����� VM_COUNTERS PeakVirtualSize VirtualSize PageFaultCount PeakWorkingSetSize WorkingSetSize QuotaPeakPagedPoolUsage QuotaPagedPoolUsage QuotaPeakNonPagedPoolUsage QuotaNonPagedPoolUsage PagefileUsage PeakPagefileUsage �˵���Ϣ ���� �Ƿ���� �¼� ����_����������ͼ��ť ���� ID ͼƬ���� ͼ�� ��ʾ�ı� ��ť��� DISPLAY_DEVICEA cb DeviceName DeviceString StateFlags DeviceID DeviceKey MOUSEHOOKSTRUCT pt hwnd wHitTestCode dwExtraInfo POINT X Y ģ����Ϣ ģ���� ģ��·�� ����_������Ϣ ���� �������� Mac Ip ���� ���� DNS1 DNS2 �ٽ����� ��ʶ LockCount RecursionCount OwningThread LockSemaphore SpinCount ������Ϣ ��� ���� ���� �߶� ����_��ϸ��Ϣ �Ӵ����� �ؼ�ID �ؼ����� �ؼ����� �ؼ�״̬ �ؼ����� �ؼ�ֵ ����λ�� ������Ϣ Ĭ�϶��� ״̬��ʶ ���ͱ�ʶ ��Ļλ�� ���ڴ�С ����_��������Ƴ��¼� ��� ��Ϣ���Ӿ�� �����¼� �Ƴ��¼� PROCESS_BASIC_INFORMATION ExitStatus PebBaseAddress AffinityMask BasePriority UniqueProcessId InheritedFromUniqueProcessId �ͻ���Ϣ IP �˿� ��� �׽��ֵ�ַ ���� �˿� ��ַ ��ַ��Χ �׽�����Ϣ �汾 �߰汾 ���� ϵͳ״̬ ����׽��� ���Udp ��Ϣ ����_������Ϣ �ͺ� ���к� �̼��汾 ��Ŀ���� ��Ŀ�ı� ͼƬ���� ѡ��ͼƬ���� ��Ŀ��ֵ �Ƿ�Ӵ� ��Ŀ��� �߳�����֤ ������Ϣ ������ �ݹ���� ӵ���߳� ���ź��� ������ �б�����Ϣ ���� ͼƬ���� ״̬ͼƬ���� ������ֵ ������Ŀ �б��� ��ͼƬ���� ����_��ɫ�Ի��� ���� ���ھ�� hInstance rgbResult ��ɫ������ lCustData lpfnHook lpTemplateName ����_ģ����Ϣ size mid pid gusage pusage base ��С ģ���� ģ���ļ��� ģ������·�� ����_������Ϣ ����ID ������ ����ȫ·���� ����_���̽ṹ ���̾�� �߳̾�� ���̱�ʶ�� �̱߳�ʶ�� ����_������Ϣ ���ھ�� ����ID �߳�ID ���ڱ��� �������� ����_������Ϣ���� ���̱�ʶ�� �������� ����ģ���ʶ�� �����̱�ʶ�� �߳�����Ȩ �߳��� ����_������Ϣ�б� dwSize cntUsage ����ID th32DefaultHeapID th32ModuleID cntThreads th32ParentProcessID pcPriClassBase dwFlags �������� ����_���� �� �� ���� �� ����_λ�úʹ�С ��� ���� ���� �߶� ����_���� ��� ���� �ұ� �ױ� ����ṹ��Ϣ ���� ���� flags �� �� ����_�ڴ����� �����ַ �����ַ ��ʼ���� ���򳤶� ����ֵ ��ǰ���� ҳ���� OPENFILENAME �ṹ��С ���ھ�� ʵ����� ������ �Զ�������� �Զ����������󳤶� ���������� �ļ��� �ļ�����󳤶� �ļ����� �ļ�������󳤶� ��ʼĿ¼ ���� ��־ �ļ�ƫ���� �ļ���չ�� Ĭ����չ�� �Զ������� �ص�������ַ ģ���� ����_ʱ�� �� �� ���� �� ʱ �� �� �� OSVERSIONINFOEX dwOSVersionInfoSize dwMajorVersion dwMinorVersion dwBuildNumber dwPlatformId szCSDVersion wServicePackMajor wServicePackMinor wSuiteMask wProductType wReserved ע���_�� ������ ��ֵ ���� STARTUPINFO cb lpReserved lpDesktop lpTitle dwX dwY dwXSize dwYSize dwXCountChars dwYCountChars dwFillAttribute dwFlags wShowWindow cbReserved2 lpReserved2 hStdInput hStdOutput hStdError lpAttributeList GUID Data1 Data2 Data3 Data4 URL_COMPONENTS dwStructSize lpszScheme dwSchemeLength nScheme lpszHostName dwHostNameLength nPort lpszUserName dwUserNameLength lpszPassword dwPasswordLength lpszUrlPath dwUrlPathLength lpszExtraInfo dwExtraInfoLength LOGFONT lfHeight lfWidth lfEscapement lfOrientation lfWeight lfItalic lfUnderline lfStrikeOut lfCharSet lfOutPrecision lfClipPrecision lfQuality lfPitchAndFamily lfFaceName ���ý����� ������ �� ���������� ���������� ֵ SYSTEM_PROCESS_INFORMATION NextEntryDelta ThreadCount Reserved1 CreateTime UserTime KernelTime ImageName BasePriority ProcessId InheritedFromProcessId HandleCount Reserved2 VirtualMemoryCounters IoCounters ����_ϵͳ�����б� �������� ��ʾ���� ���� �ļ�·�� �������� ����״̬ ��½Ϊ ����_ϵͳ�����б�Ex �������� ��ʾ���� ���� ����ID �ļ�·�� �������� ����״̬ ��½Ϊ Cookie �� ֵ ����_������Ϣ_���� �������� �������� �������� ��������n �������� MAC��ַ IP��ַ �������� ���ص�ַ ��ѡDNS������ ����DNS������ �Ƿ�����DHCP ����_IP������ IP ���� ʡ�� ���� ��Ӫ�� ģ������ dwFlags fEnable hRgnBlur fTransitionOnMaximized ����ͼ���� dwFlags Ŀ����� Դ���� ͸���� ���� �������� COMBOBOXINFO cbSize rcItem rcButton stateButton hwndCombo hwndItem hwndList WINDOWPLACEMENT Length flags showCmd ptMinPosition ptMaxPosition rcNormalPosition WIN32_FIND_DATAW dwFileAttributes ftCreationTime ftLastAccessTime ftLastWriteTime nFileSizeHigh nFileSizeLow dwReserved0 dwReserved1 cFileName cAlternateFileName ����_ʱ����Ϣ ʱ�� ʱ���� ʱ������ ����_�Կ���Ϣ �Կ����� ��������汾�� �ڴ��С ���� ��ϸ���� ����_����վ�е��ļ���Ϣ ��ǰ��·�� ԭ·�� ɾ��ʱ�� ����_�������������� ״̬ ���� ���������� ������ַ ����DHCP IPv4��ַ IPv4�������� IPv4Ĭ������ DHCP������ IPv4DNS������ ����IPv6��ַ IPv6���� IPv6Ĭ������ IPv6DNS������ JsonError Number Source Description HelpFile HelpContext Text Line Column ����_ģ����Ϣ ģ���� ģ���ļ��� ģ������·�� INPUT type ki KEYBDINPUT wVk wScan dwFlags time dwExtraInfo uMsg wParamL wParamH ����_�����б���Ŀ Ŀ�� ������ ͼ��·�� ��ʼλ�� ���� SYSTEM_POWER_STATUS ACLineStatus BatteryFlag BatteryLifePercent SystemStatusFlag BatteryLifeTime BatteryFullLifeTime ��ͨ��� �ڴ� HeapSize GetOEMCP GdipDeleteBrush SetConsoleMode GetConsoleMode InvalidateRect CoInternetSetFeatureEnabled GetVolumeInformationA GetFileAttributesA LocalSize_IP_ADDR_STRING CopyMemory_IP_ADDR_STRING LocalSize_IP_ADAPTER_INFO GetPtr_IP_ADAPTER_INFO GetPtr_Bin SetProcessDPIAware strrchr strchr ��ȡ�豸GammaRamp �����豸GammaRamp Beep ȡָ��_�ֽڼ� RtlMoveMemory_������ַ1 ZwOpenProcess ZwDuplicateObject ZwCreateJobObject ZwAssignProcessToJobObject ZwTerminateJobObject ZwTerminateProcess ZwClose GetProcessImageFileNameA �ر��ں˶���_ QueryDosDeviceA RtlMoveMemory_IMAGE_DOS_HEADER CoCreateGuid RtlMoveMemory_�ֽڼ���ַ1 HeapDestroy HeapCreate InitializeCriticalSection_�ٽ����� DeleteCriticalSection_�ٽ����� EnterCriticalSection_�ٽ����� LeaveCriticalSection_�ٽ����� RtlMoveMemory_Eint_int RtlMoveMemory_Ebin_int RtlMoveMemory_Estr_int AccessibleChildren AccessibleObjectFromWindow RtlMoveMemory_obj2pint GetStateText GetStateText_int GetRoleText GetRoleText_int WindowFromAccessibleObject AccessibleObjectFromPoint BlockInput GetShortPathName CryptHashData_x CryptReleaseContext_x CryptCreateHash_x CryptAcquireContext_x NtReadVirtualMemory_Bin GetQueuedCompletionStatus SHChangeNotify GetFileTitleA CreateIoCompletionPort PostQueuedCompletionStatus RemovePropA SetPropA GetPropA WriteFile GetScrollPos DeleteUrlCacheEntry FindFirstUrlCacheEntryA FindNextUrlCacheEntryA FindCloseUrlCache SHFileOperationA gethostbyname UpdateWindow gethostname sendto connect select InternetOpenUrlA WSAAsyncSelect getpeername GetsockName recv_�ֽڼ� send ntohs inet_ntoa accept listen bind htons socket closesocket WSACleanup WSAStartup SendARP inet_addr IsWow64Process QueryPerformanceFrequency QueryPerformanceCounter ActivateKeyboardLayout ImmInstallIMEA UnloadKeyboardLayout GetKeyboardLayoutList LoadKeyboardLayoutA IMESetPubString IMEClearPubString GetGUIThreadInfo GetAsyncKeyState StretchBlt FindWindowA GetAncestor GetParent CallWindowProcA GetWindow MessageBoxA LoadLibraryA FreeLibrary GetProcAddress DoOrganizeFavDlg DoAddToFavDlg SHGetSpecialFolderLocation CreateWaitableTimerA SetWaitableTimer MsgWaitForMultipleObjects CryptAcquireContextA CryptCreateHash CryptReleaseContext CryptDestroyHash CryptHashData CryptGetHashParam GetSystemMetrics ExtractAssociatedIconA DrawIcon LoadImage HeapAlloc GetProcessHeap SetMenuItemBitmaps InsertMenuA CreatePopupMenu ModifyMenuA DrawMenuBar GetMenuItemCount RemoveMenu AppendMenuA GetMenu GetSubMenu InsertMenu IsMenu GetMenuStringA DestroyMenu GetMenuItemID GdiplusStartup GdiplusShutdown InternetFindNextFileA FtpFindFirstFileA FtpGetFileA FtpPutFileA FtpDeleteFileA FtpSetCurrentDirectoryA FtpGetCurrentDirectoryA FtpRenameFileA PathIsDirectoryA FtpCreateDirectoryA FtpGetFileSize FtpOpenFileA RemoveDirectoryA FtpRemoveDirectoryA VirtualAllocEx GetLocalTime GlobalSize lstrcpyn_�ı��� lstrcpyn_����ʱ���� lstrcpyn_������ lstrcpyn_�ӳ���ָ�� lstrcpyn_С���� lstrcpyn_˫����С���� lstrcpyn_�������� lstrcpyn_�������� SetHandleCount_�ֽ��� lstrcpyn_�ֽ��� lstrcpyn_�ֽڼ� lstrcpyn_���� GdipCreateHBITMAPFromBitmap GdipCreateBitmapFromHBITMAP GlobalFree CreateStreamOnHGlobal GDIpSaveImageToStream_GUID RtlMoveMemory_int2Bytes CallNextHookEx SetWindowsHookExA UnhookWindowsHookEx WriteProcessMemory_�ı��� LocalSize_SHELLEXECUTEINFOA LocalSize RtlMoveMemory_�ֽڼ� RtlMoveMemory_BITMAPINFO RtlMoveMemory_BITMAPFILEHEADER GetDIBColorTable RtlMoveMemory_λͼ��Ϣ GetBitmapBits CreateDIBSection1 CreateDIBSection RtlMoveMemory_BITMAPFILEHEADER_�ֽ��� RtlMoveMemory_BITMAPINFOHEADER LsaFreeMemory LsaClose RtlMoveMemory_NMLVCUSTOMDRAW DrawText WriteProcessMemory_д�ֽ� ReadProcessMemory_�ֽ��� VirtualProtectEx VirtualProtect VirtualQueryEx WriteProcessMemory_����3 ReadProcessMemory_������ ReadProcessMemory_�������� ReadProcessMemory_�������� WriteProcessMemory_С���� ReadProcessMemory_С���� ReadProcessMemory_������1 ReadProcessMemory_������2 CreateMutexA WriteProcessMemory_�ֽڼ� ReadProcessMemory_�ֽڼ� Module32First Module32Next GetModuleHandleA1 GetModuleHandleA PathFindExtensionA PathRenameExtensionA PathRemoveFileSpec PathMatchSpec PathFindFileNameA DeleteFileA SetEndOfFile SetFilePointer CreateFileA MapViewOfFile InternetSetOptionA InternetSetOptionA_��ַ DoFileDownload CopyFileA ShellExecuteA MoveFileExA MoveFileA PostMessageA CreateSolidBrush GdiFlush FillRect DeleteObject InternetOpenA InternetConnectA InternetSetOption InternetCloseHandle HttpQueryInfoA InternetReadFile HttpOpenRequestA HttpSendRequestA InflateRect ChangeWindowMessageFilter SendMessageW LocalAlloc LocalFree IsWindowEnabled GetClassLongA SendMessageA GetSystemMenu CreateFileMappingA SetDIBitsToDevice SHGetPathFromIDListA SetBkMode TextOutA SetTextColor SelectObject CreateCompatibleBitmap CreateFontA IsDebuggerPresent CreateCompatibleDC CreateEvent OpenEventA lstrcpynA_�ֽڼ� lstrcpynA_�������� lstrcpynA_�ֽ��� lstrcpynA_ָ�� lstrcpynA_�ı� SwapMouseButton ZwResumeProcess ZwSuspendProcess ResumeThread SuspendThread WaitForSingleObject InitializeCriticalSection DeleteCriticalSection EnterCriticalSection LeaveCriticalSection DuplicateHandle CloseHandle lstrlen DeviceIoControl1 Process32Next GetModuleFileNameExA Process32First OpenProcess TerminateProcess GetCurrentProcessId CreateToolhelp32Snapshot GetWindowThreadProcessId LBItemFromPt ShowWindow SetWindowPos CloseWindow ShowWindowAsync BringWindowToTop GetForegroundWindow ExtractIconExA MoveWindow GetWindowRect IsZoomed IsIconic IsWindowVisible StrTrimA FlashWindow lstrlenA WideCharToMultiByte GetDC ReleaseDC GetPixel GetDIBits2 GetDIBits1 GetDIBits BitBlt VirtualAlloc MultiByteToWideChar CharUpperA CharLowerA GetClientRect IsChild SetParent IsWindow EnumChildWindows_���� EnumChildWindows EnumWindows SetActiveWindow RedrawWindow EnableMenuItem OpenIcon GetFocus GetDesktopWindow ChildWindowFromPoint GetClassNameA SetWindowRgn AtlAxWinInit AtlAxGetControl GetTextExtentPointA CreateWindowExA CreateWindowExW GetWindowLongA GetWindowTextA GetWindowTextW Thread32Next SHGetSpecialFolderPathA GetTempPathA GetSystemDirectoryA GetWindowsDirectoryA PathMakeSystemFolderA PathIsSystemFolderA PathUnmakeSystemFolderA PathIsDirectoryEmptyA InternetGetCookieExA InternetGetCookieA InternetSetCookieA ChooseColorA PrintWindow OpenProcessToken ObjectFromLresult SendMessageTimeoutA RegisterWindowMessageA RegisterHotKey UnregisterHotKey OpenFileMappingA UnmapViewOfFile VirtualFreeEx GetCurrentProcess CreateThread GetUrlCacheEntryInfo PathAppend ImmGetDescriptionA ImmIsIME DeleteDC GetKeyboardLayout GetLogicalDriveStringsA GetDiskFreeSpaceExA GetDriveTypeA LockWorkStation SetSuspendState ExitWindowsEx SHEmptyRecycleBinA SHFormatDrive SystemParametersInfoA GetUserNameA waveOutGetVolume waveOutSetVolume ChangeDisplaySettingsA GetComputerNameA EnumDisplaySettingsA SHAppBarMessage GetDateFormatA SystemTimeToVariantTime GetTimeFormatA GetInputState EnumThreadWindows CreateRoundRectRgn ClientToScreen SetFocus SetForegroundWindow ShowCursor ClipCursor LoadCursor SetCursor GetDoubleClickTime SetCursorPos SetClassLongA LoadCursorFromFileA SetCapture ReleaseCapture mouse_event GetClipboardOwner GetClipboardData CloseClipboard SetClipboardData GetDIBits3 SetPixelV DrawIconEx EmptyClipboard GetObjectA GlobalLock GlobalUnlock GlobalAlloc IsClipboardFormatAvailable RegisterClipboardFormatA RtlMoveMemory_�ֽ���_���� RtlMoveMemory_�ֽ��� RtlMoveMemory_�ı��� RtlMoveMemory_������_���ļ� DragQueryFileA OpenClipboard keybd_event SetLayeredWindowAttributes SetWindowTextA SetWindowTextW WindowFromPoint ShowScrollBar SetTimer KillTimer GetWindowDC CreatePen GetStockObject SetROP2 Rectangle GetCurrentThread GetCurrentThreadId CreateFontIndirectA OpenThread CreateDCA lpRect PatBlt GetDlgCtrlID GetDlgItem CoInitialize CoUninitialize WinExec OpenSCManagerA OpenService ControlService DeleteService CloseServiceHandle StartService QueryServiceStatus QueryServiceStatusEx ChangeServiceConfig CreateService QueryServiceConfig2 UnlockServiceDatabase QueryServiceConfig2A_�ֽ� ZwQuerySystemInformation CreateRemoteThread GetExitCodeThread InternetGetConnectedStateExA ԭ�ӵ������� ԭ�ӵݼ����� DragFinish DragAcceptFiles RegCloseKey RegCreateKeyA RegQueryValueExA RegOpenCurrentUser RegEnumValueA RegEnumKeyA RegDeleteKeyA RegOpenKeyA RegSetValueExA RegSetValueExA_��ֵ RasDialA RasHangUpA RasGetEntryDialParams GlobalSize_ȡ������Ϣ�ýṹ GetPrivateProfileInt ConvertSidToStringSid IsValidSid LookupAccountName LsaOpenPolicy RasEnumEntrie RasEnumEntries InternetGetConnectedStateEx RasSetEntryPropertiesA RasSetCredentialsA GetKeyState GetOpenFileNameA GetSaveFileNameA ExtractIconA SHAutoComplete GetShortPathNameA GetLongPathNameA GetAdaptersInfo CopyMemory_ip_adapter_info CopyMemory_ias ImageList_Read ImageList_Write ImageList_Replace ImageList_ReplaceIcon ImageList_AddIcon ImageList_Add ImageList_SetBkColor ImageList_GetBkColor ImageList_SetIconSize ImageList_SetImageCount ImageList_GetImageCount ImageList_GetIconSize ImageList_Remove ImageList_Create ImageList_Destroy SetWindowLongA SetWindowLongW GetCommandLineA LsaRetrievePrivateData GetVersionEx GetVersion GlobalSize_RASENTRY IsBadStringPtrA GetLastError QueryServiceConfig_�ֽ� QueryServiceConfig GetServiceKeyName GetServiceDisplayName LockServiceDatabase ChangeServiceConfig2A StartServiceCtrlDispatcher RegisterServiceCtrlHandler SetServiceStatus GdipLoadImageFromStream GdipGetImageDimension GdipCreateFromHDC GdipDrawImageRect GdipGetImageThumbnail GdipDisposeImage GdipDeleteGraphics UpdateLayeredWindow InitCompression CreateCompression Compress DestroyCompression InitDecompression CreateDecompression DestroyDecompression ShellExecuteEx RegOpenKeyExA RegCreateKeyExA DrawTextA FindWindowExA capGetDriverDescriptionA AddFontResourceA RemoveFontResourceA RtlMoveMemory_�ֽڼ�2 PathFileExistsA StrToIntEx lstrcmp Sleep PeekNamedPipe_�ֽڼ� RtlAdjustPrivilege ILCreateFromPathA ILFree SHOpenFolderAndSelectItems GetFileInformationByHandle GetVolumeInformation ZwQueryInformationFile GetFileAttributes EnumProcesses GetNetworkParams CopyMemory_Bytes2int WinHelpA GetMessageA GetEnvironmentVariable SetEnvironmentVariable CopyMemory_objcet2int lstrcat_int2variant GetCurrentDirectory WinHttpCrackUrl MessageBoxTimeoutA CreateTimerQueueTimer CreateTimerQueue DeleteTimerQueueTimer DeleteTimerQueue ChangeTimerQueueTimer PathIsURL Shell_NotifyIcon GetTopWindow GetNextWindow GetWindowTextLengthA GetWindowTextLengthW AttachThreadInput Thread32First gethostbyaddr CopyMemory_int2hostent IcmpCreateFile IcmpSendEcho IcmpCloseHandle WinHttpCheckPlatform WinHttpOpen WinHttpConnect WinHttpOpenRequest WinHttpCloseHandle WinHttpSetTimeouts WinHttpSetOption WinHttpAddRequestHeaders WinHttpSendRequest WinHttpReceiveResponse WinHttpQueryDataAvailable WinHttpReadData WinHttpQueryHeaders GetCalendarInfo GetCompressedFileSize RtlGetNtProductType RtlGetProductInfo RtlGetNtVersionNumbers InternetQueryOption ReadFile_�ֽڼ� CreateSemaphore OpenSemaphore ReleaseSemaphore GetDeviceCaps GetClipboardFormatNameA RtlMoveMemory DwmUpdateThumbnailProperties DwmUnregisterThumbnail DwmSetIconicThumbnail DwmRegisterThumbnail DwmIsCompositionEnabled DwmEnableComposition DwmExtendFrameIntoClientArea DwmEnableBlurBehindWindow GdipGetPropertyItemSize GdipGetPropertyItem GetCaretPos EnumDisplayMonitors ChangeClipboardChain SetClipboardViewer GetClipboardViewer SHGetFolderPathA GetComboBoxInfo wcslen wcscmp memset memcpy GetTickCount64 SendInput GetWindowPlacement SetWindowPlacement GetSystemPowerStatus SetProcessWorkingSetSize �ɴ��ڹ��� LMEM_ZEROINIT WM_NOTIFY NM_CUSTOMDRAW CDDS_PREPAINT CDRF_NOTIFYSUBITEMDRAW CDDS_ITEMPREPAINT CDDS_SUBITEM DT_VCENTER DT_LEFT DT_SINGLELINE CDRF_SKIPDEFAULT WS_POPUP IMAGE_BITMAP IMAGE_ICON IMAGE_CURSOR STIF_DEFAULT STIF_SUPPORT_HEX CP_gb2312 CP_UTF8 HtmlEntitiesTable ERROR_BUFFER_OVERFLOW ERROR_SUCCESS MIB_IF_TYPE_ETHERNET MIB_IF_TYPE_FDDI MIB_IF_TYPE_LOOPBACK MIB_IF_TYPE_OTHER MIB_IF_TYPE_PPP MIB_IF_TYPE_SLIP MIB_IF_TYPE_TOKENRING MIB_IF_TYPE_IEEE80211 ERROR_INSUFFICIENT_BUFFER WM_GETTEXTLENGTH SMTO_NORMAL ��������Ϣ �ͻ���Ϣ FD_CLOSE FD_ACCEPT FD_READ PF_INET SOCK_STREAM SOCK_DGRAM IPPROTO_TCP IPPROTO_UDP SRCCOPY ��ҳ����_��ҳ���� ��ҳ����_��ҳ��ַ ��ҳ����_��ҳԴ�� ��ҳ����_��ҳ�ı� ��ҳ����_��վ���� ��ҳ����_������Դ ��ҳ����_����ʱ�� ��ҳ����_�޸�ʱ�� ��ҳ����_Cookies ��ҳ����_�������� ��ҳ����_�ĵ���С �ű�����_JavaScript �ű�����_VBScript ��ҳ�¼�_selectedIndex ��ҳ�¼�_onabort ��ҳ�¼�_onafterprint ��ҳ�¼�_onafterupdate ��ҳ�¼�_onbeforeactivate ��ҳ�¼�_onbeforecopy ��ҳ�¼�_onbeforecut ��ҳ�¼�_onbeforedeactivate ��ҳ�¼�_onbeforeeditfocus ��ҳ�¼�_onbeforepaste ��ҳ�¼�_onbeforeprint ��ҳ�¼�_onbeforeunload ��ҳ�¼�_onbeforeupdate ��ҳ�¼�_onblur ��ҳ�¼�_onbounce ��ҳ�¼�_oncellchange ��ҳ�¼�_onchange ��ҳ�¼�_oncontextmenu ��ҳ�¼�_oncontrolselect ��ҳ�¼�_oncopy ��ҳ�¼�_oncut ��ҳ�¼�_ondataavailable ��ҳ�¼�_ondatasetchanged ��ҳ�¼�_ondatasetcomplete ��ҳ�¼�_ondeactivate ��ҳ�¼�_ondrag ��ҳ�¼�_ondragend ��ҳ�¼�_ondragenter ��ҳ�¼�_ondragleave ��ҳ�¼�_ondragover ��ҳ�¼�_ondragstart ��ҳ�¼�_ondrop ��ҳ�¼�_onerror ��ҳ�¼�_onerrorupdate ��ҳ�¼�_onfilterchange ��ҳ�¼�_onfinish ��ҳ�¼�_onfocus ��ҳ�¼�_onfocusin ��ҳ�¼�_onfocusout ��ҳ�¼�_onhelp ��ҳ�¼�_onkeydown ��ҳ�¼�_onkeypress ��ҳ�¼�_onkeyup ��ҳ�¼�_onlayoutcomplete ��ҳ�¼�_onload ��ҳ�¼�_onlosecapture ��ҳ�¼�_onmousedown ��ҳ�¼�_onmouseenter ��ҳ�¼�_onmouseleave ��ҳ�¼�_onmousemove ��ҳ�¼�_onmouseout ��ҳ�¼�_onmouseover ��ҳ�¼�_onmouseup ��ҳ�¼�_onmousewheel ��ҳ�¼�_onmove ��ҳ�¼�_onmoveend ��ҳ�¼�_onmovestart ��ҳ�¼�_onpaste ��ҳ�¼�_onpropertychange ��ҳ�¼�_onreadystatechange ��ҳ�¼�_onreset ��ҳ�¼�_onresize ��ҳ�¼�_onresizeend ��ҳ�¼�_onresizestart ��ҳ�¼�_onrowenter ��ҳ�¼�_onrowexit ��ҳ�¼�_onrowsdelete ��ҳ�¼�_onrowsinserted ��ҳ�¼�_onscroll ��ҳ�¼�_onselect ��ҳ�¼�_onselectionchange ��ҳ�¼�_onselectstart ��ҳ�¼�_onstart ��ҳ�¼�_onstop ��ҳ�¼�_onunload ��ҳ�¼�_onsubmit ��ҳ�¼�_focus ��ҳ�¼�_click ��ҳ�¼�_onclick ��ҳ�¼�_ondblclick PROCESS_VM_OPERATION PROCESS_CREATE_THREAD PROCESS_DUP_HANDLE INFINITE PROCESS_QUERY_INFORMATION PROCESS_VM_READ PROCESS_ALL_ACCESS MEM_PRIVATE PROCESS_VM_WRITE PAGE_READWRITE ���� ���� �ػ� ���� GENERIC_READ FILE_FLAG_SEQUENTIAL_SCAN GENERIC_WRITE OPEN_ALWAYS FILE_ATTRIBUTE_READONLY FILE_ATTRIBUTE_HIDDEN FILE_ATTRIBUTE_SYSTEM FILE_ATTRIBUTE_DIRECTORY FILE_ATTRIBUTE_ARCHIVE INTERNET_FLAG_RELOAD INTERNET_COOKIE_THIRD_PARTY INTERNET_FLAG_NO_COOKIES INTERNET_FLAG_NO_CACHE_WRITE INTERNET_FLAG_NO_AUTO_REDIRECT INTERNET_FLAG_SECURE INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS INTERNET_FLAG_PASSIVE INTERNET_OPTION_HTTP_DECODING ����_SC_MANAGER_CREATE_SERVICE ����_SERVICE_ALL_ACCESS ����_SERVICE_WIN32_OWN_PROCESS ����_SERVICE_STOPPED ����_SERVICE_ACCEPT_STOP ����_SERVICE_ACCEPT_SHUTDOWN ����_SERVICE_WIN32_SHARE_PROCESS ����_SERVICE_CONTROL_SHUTDOWN ����_SERVICE_CONTROL_STOP ����_SERVICE_CONFIG_DESCRIPTION ����_SERVICE_ERROR_NORMAL ����_SERVICE_INTERACTIVE_PROCESS ����_SERVICE_AUTO_START GENERIC_EXECUTE SERVICE_START SC_MANAGER_ALL_ACCESS SERVICE_QUERY_STATUS SERVICE_STOP DELETE SC_MANAGER_LOCK SERVICE_CHANGE_CONFIG SERVICE_QUERY_CONFIG SERVICE_NO_CHANGE SQL_NULL_HANDLE SQL_HANDLE_ENV SQL_HANDLE_DBC SQL_HANDLE_STMT SQL_HANDLE_DESC SQL_SUCCESS SQL_SUCCESS_WITH_INFO SQL_NO_DATA SQL_ERROR SQL_INVALID_HANDLE SQL_STILL_EXECUTING SQL_NEED_DATA SQL_ATTR_ODBC_VERSION SQL_ATTR_CONNECTION_POOLING SQL_ATTR_CP_MATCH SQL_OV_ODBC2 SQL_OV_ODBC3 SQL_IS_POINTER SQL_IS_UINTEGER SQL_IS_INTEGER SQL_IS_USMALLINT SQL_IS_SMALLINT SQL_SIGNED_OFFSET SQL_UNSIGNED_OFFSET SQL_C_SLONG SQL_DRIVER_NOPROMPT SQL_DRIVER_COMPLETE SQL_DRIVER_PROMPT SQL_DRIVER_COMPLETE_REQUIRED SQL_C_CHAR SQL_C_LONG SQL_C_SHORT SQL_C_FLOAT SQL_C_DOUBLE SQL_C_NUMERIC SQL_C_DEFAULT SQL_C_DATE SQL_C_TIME SQL_C_TIMESTAMP SQL_C_BINARY SQL_C_BIT SQL_C_SBIGINT SQL_C_UBIGINT SQL_C_TINYINT SQL_UNKNOWN_TYPE SQL_CHAR SQL_NUMERIC SQL_DECIMAL SQL_INTEGER SQL_SMALLINT SQL_FLOAT SQL_REAL SQL_DOUBLE SQL_DATE SQL_TIME SQL_TIMESTAMP SQL_VARCHAR SQL_LONGVARCHAR SQL_BINARY SQL_VARBINARY SQL_LONGVARBINARY SQL_BIGINT SQL_TINYINT SQL_BIT SQL_GUID SQL_ATTR_ACCESS_MODE SQL_ATTR_AUTOCOMMIT SQL_ATTR_CONNECTION_TIMEOUT SQL_ATTR_CURRENT_CATALOG SQL_ATTR_DISCONNECT_BEHAVIOR SQL_ATTR_ENLIST_IN_DTC SQL_ATTR_ENLIST_IN_XA SQL_ATTR_LOGIN_TIMEOUT SQL_ATTR_ODBC_CURSORS SQL_ATTR_PACKET_SIZE SQL_ATTR_QUIET_MODE SQL_ATTR_TRACE SQL_ATTR_TRACEFILE SQL_ATTR_TRANSLATE_LIB SQL_ATTR_TRANSLATE_OPTION SQL_ATTR_TXN_ISOLATION SQL_ATTR_CONNECTION_DEAD SQL_CD_TRUE SQL_CD_FALSE SQL_PARAM_TYPE_UNKNOWN SQL_PARAM_INPUT SQL_PARAM_INPUT_OUTPUT SQL_RESULT_COL SQL_PARAM_OUTPUT SQL_RETURN_VALUE SQL_NTS SQL_AUTOCOMMIT_OFF SQL_AUTOCOMMIT_ON SQL_COMMIT SQL_ROLLBACK SQL_ATTR_CURSOR_TYPE SQL_ATTR_ROW_NUMBER SQL_ATTR_MAX_ROWS �������_��ǰ �������_���� �������_��̬ �������_��̬ SQL_FETCH_NEXT SQL_FETCH_FIRST SQL_FETCH_LAST SQL_FETCH_PRIOR SQL_FETCH_ABSOLUTE SQL_FETCH_RELATIVE INTERNET_OPTION_PROXY INTERNET_OPTION_SETTINGS_CHANGED INTERNET_OPTION_CONNECT_TIMEOUT INTERNET_OPTION_SEND_TIMEOUT INTERNET_OPTION_RECEIVE_TIMEOUT SQLITE_�ɹ� SQLITE_���� SQLITE_�ڲ� SQLITE_Ȩ�� SQLITE_��ֹ SQLITE_��æ SQLITE_���� SQLITE_�����ڴ�ʧ�� SQLITE_ֻ�� SQLITE_�ж� SQLITE_IO���� SQLITE_�� SQLITE_Ϊ�ҵ� SQLITE_���ݿ��� SQLITE_���ܴ� SQLITE_Э�� SQLITE_�ޱ� SQLITE_�ṹ SQLITE_��̫�� SQLITE_Լ�� SQLITE_��ƥ�� SQLITE_���� SQLITE_��֧��OS SQLITE_��֤ SQLITE_��ʽ SQLITE_��Χ SQLITE_�����ݿ� SQLITE_�� SQLITE_��� SQLITE_UTF8 SQLITE_UTF16 SQLITE_UTF16BE SQLITE_UTF16LE SQLITE_ANY SQLITE_OPEN_READONLY SQLITE_OPEN_READWRITE SQLITE_OPEN_CREATE S3�ֶ�����_���� S3�ֶ�����_������ S3�ֶ�����_�ı��� S3�ֶ�����_�ֽڼ��� S3�ֶ�����_�� S3����_��̬ S3����_��ʱ S3��������_���� S3��������_ɾ�� S3��������_���� S3��������_�ֶθ��� S3����ʱ��_��ͨģʽ S3����ʱ��_֮ǰ S3����ʱ��_֮�� SW_SHOWMINNOACTIVE SW_SHOWNOACTIVATE SW_SHOWMAXIMIZED SW_SHOWMINIMIZED SW_SHOWNORMAL SW_SHOWDEFAULT ABE_BOTTOM SW_HIDE STARTF_USESHOWWINDOW STARTF_USESTDHANDLES STILL_ACTIVE URLMON_OPTION_USERAGENT HKEY_CURRENT_CONFIG HKEY_PERFORMANCE_DATA HKEY_USERS HKEY_LOCAL_MACHINE HKEY_CURRENT_USER HKEY_CLASSES_ROOT KEY_ALL_ACCESS KEY_WOW64_64KEY KEY_WOW64_32KEY KEY_READ KEY_WRITE REG_NONE REG_BINARY REG_DWORD REG_SZ REG_DWORD_LITTLE_ENDIAN REG_DWORD_BIG_ENDIAN REG_LINK REG_EXPAND_SZ REG_MULTI_SZ ERROR_MORE_DATA ERROR_NO_MORE_ITEMS WS_EX_TOPMOST WS_DISABLED CDS_FULLSCREEN CDS_GLOBAL CDS_UPDATEREGISTRY WS_EX_ACCEPTFILES HEAP_ZERO_MEMORY REG_OPTION_NON_VOLATILE REG_QWORD �����¼�_�ƶ���� �����¼�_���������� �����¼�_�ͷ������� �����¼�_˫�������� �����¼�_��������Ҽ� �����¼�_�ͷ�����Ҽ� �����¼�_˫������Ҽ� �����¼�_��������м� �����¼�_�ͷ�����м� �����¼�_˫������м� �����¼�_�����ؽ� �����¼�_�����˳� ����ͼ��_��ͼ�� ����ͼ��_��Ϣͼ�� ����ͼ��_����ͼ�� ����ͼ��_����ͼ�� WS_CHILD GW_HWNDLAST GW_HWNDNEXT GW_HWNDPREV GW_CHILD GW_ENABLEDPOPUP BM_CLICK WINHTTP_ACCESS_TYPE_NO_PROXY WINHTTP_ACCESS_TYPE_DEFAULT_PROXY WINHTTP_ACCESS_TYPE_NAMED_PROXY INTERNET_SCHEME_HTTPS INTERNET_SCHEME_HTTP WINHTTP_NO_REFERER WINHTTP_DEFAULT_ACCEPT_TYPES WINHTTP_FLAG_SECURE WINHTTP_AUTH_TARGET_SERVER WINHTTP_AUTH_TARGET_PROXY WINHTTP_AUTH_SCHEME_BASIC WINHTTP_OPTION_DISABLE_FEATURE WINHTTP_OPTION_ENABLE_FEATURE WINHTTP_DISABLE_COOKIES WINHTTP_DISABLE_REDIRECTS WINHTTP_OPTION_SECURITY_FLAGS WINHTTP_ADDREQ_FLAG_ADD WINHTTP_ADDREQ_FLAG_REPLACE WINHTTP_QUERY_RAW_HEADERS_CRLF WINHTTP_NO_HEADER_INDEX WINHTTP_ADDREQ_FLAG_ADD_IF_NEW WINHTTP_ADDREQ_FLAG_COALESCE WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON VER_NT_WORKSTATION SystemProcessInformation WH_KEYBOARD WH_KEYBOARD_LL WH_MOUSE_LL WH_MOUSE HC_ACTION INVALID_HANDLE_VALUE SERVICE_INTERACTIVE_PROCESS SERVICE_ALL_ACCESS SERVICE_ERROR_NORMAL SC_MANAGER_CONNECT SERVICE_ENUMERATE_DEPENDENTS SC_MANAGER_ENUMERATE_SERVICE NIF_INFO NIF_ICON NIF_TIP NIF_MESSAGE STD_OUTPUT_HANDLE STD_INPUT_HANDLE EM_REPLACESEL FOREGROUND_RED FOREGROUND_INTENSITY FOREGROUND_GREEN FOREGROUND_BLUE GMEM_MOVEABLE sizeof_SECURITY_ATTRIBUTES AuAppBat AuAppVBs IP_SUCCESS TIME_FORCE24HOURFORMAT GWL_EXSTYLE GWL_HINSTANCE GWL_ID GWL_STYLE GWL_USERDATA GWL_WNDPROC GWL_HWNDPARENT ��ʾrar���� ����rar���� ϵͳ_ALLUSERSPROFILE ϵͳ_APPDATA ϵͳ_CD ϵͳ_CMDCMDLINE ϵͳ_CMDEXTVERSION ϵͳ_COMPUTERNAME ϵͳ_COMSPEC ϵͳ_DATE ϵͳ_ERRORLEVEL ϵͳ_HOMEDRIVE ϵͳ_HOMEPATH ϵͳ_HOMESHARE ϵͳ_LOGONSEVER ϵͳ_NUMBER_OF_PROCESSORS ϵͳ_OS ϵͳ_PATH ϵͳ_PATHEXT ϵͳ_PROCESSOR_ARCHITECTURE ϵͳ_PROCESSOR_IDENTIFIER ϵͳ_PROCESSOR_LEVEL ϵͳ_PROCESSOR_REVISION ϵͳ_PROMPT ϵͳ_RANDOM ϵͳ_SYSTEMDRIVE ϵͳ_SYSTEMROOT ϵͳ_TEMP ϵͳ_TIME ϵͳ_USERDOMAIN ϵͳ_USERNAME ϵͳ_UserProfile ϵͳ_WINDIR PKCS5_PADDING RANDOM_PADDING ZERO_PADDING KP_IV KP_SALT KP_PADDING KP_MODE KP_MODE_BITS KP_PERMISSIONS KP_ALGID KP_BLOCKLEN KP_KEYLEN KP_SALT_EX KP_P KP_G KP_Q KP_X KP_Y KP_RA KP_RB KP_INFO KP_EFFECTIVE_KEYLEN KP_SCHANNEL_ALG KP_CLIENT_RANDOM KP_SERVER_RANDOM KP_RP KP_PRECOMP_MD5 KP_PRECOMP_SHA KP_CERTIFICATE KP_CLEAR_KEY KP_PUB_EX_LEN KP_PUB_EX_VAL KP_KEYVAL KP_ADMIN_PIN KP_KEYEXCHANGE_PIN KP_SIGNATURE_PIN KP_ROUNDS KP_OAEP_PARAMS KP_CMS_KEY_INFO KP_CMS_DH_KEY_INFO KP_PUB_PARAMS KP_VERIFY_PARAMS KP_HIGHEST_VERSION KP_GET_USE_COUNT SIMPLEBLOB PUBLICKEYBLOB PRIVATEKEYBLOB PLAINTEXTKEYBLOB OPAQUEKEYBLOB PUBLICKEYBLOBEX SYMMETRICWRAPKEYBLOB CUR_BLOB_VERSION HP_HASHVAL CRYPT_MODE_CBC CRYPT_MODE_ECB CRYPT_MODE_OFB CRYPT_MODE_CFB CRYPT_MODE_CTS �������_NO_PADDING �������_ZERO_PADDING �������_ANSIX923_PADDING �������_ISO10126_PADDING �������_PKCS5_PADDING �������_PKCS7_PADDING �Գ��㷨_AES_CBC �Գ��㷨_AES_ECB �Գ��㷨_AES_OFB �Գ��㷨_AES_CFB �Գ��㷨_AES_CTS �Գ��㷨_AES_192_CBC �Գ��㷨_AES_192_ECB �Գ��㷨_AES_192_OFB �Գ��㷨_AES_192_CFB �Գ��㷨_AES_192_CTS �Գ��㷨_AES_256_CBC �Գ��㷨_AES_256_ECB �Գ��㷨_AES_256_OFB �Գ��㷨_AES_256_CFB �Գ��㷨_AES_256_CTS �Գ��㷨_DES_CBC �Գ��㷨_DES_ECB �Գ��㷨_DES_OFB �Գ��㷨_DES_CFB �Գ��㷨_DES_CTS �Գ��㷨_3DES_CBC �Գ��㷨_3DES_ECB �Գ��㷨_3DES_OFB �Գ��㷨_3DES_CFB �Գ��㷨_3DES_CTS �Գ��㷨_RC2 �Գ��㷨_RC4 NULL CALG_MD2 CALG_MD4 CALG_MD5 CALG_SHA CALG_SHA1 CALG_MAC CALG_RSA_SIGN CALG_DSS_SIGN CALG_NO_SIGN CALG_RSA_KEYX CALG_DES CALG_3DES_112 CALG_3DES CALG_DESX CALG_RC2 CALG_RC4 CALG_SEAL CALG_DH_SF CALG_DH_EPHEM CALG_AGREEDKEY_ANY CALG_KEA_KEYX CALG_HUGHES_MD5 CALG_SKIPJACK CALG_TEK CALG_CYLINK_MEK CALG_SSL3_SHAMD5 CALG_SSL3_MASTER CALG_SCHANNEL_MASTER_HASH CALG_SCHANNEL_MAC_KEY CALG_SCHANNEL_ENC_KEY CALG_PCT1_MASTER CALG_SSL2_MASTER CALG_TLS1_MASTER CALG_RC5 CALG_HMAC CALG_TLS1PRF CALG_HASH_REPLACE_OWF CALG_AES_128 CALG_AES_192 CALG_AES_256 CALG_AES CALG_SHA_256 CALG_SHA_384 CALG_SHA_512 CRYPT_VERIFYCONTEXT CRYPT_NEWKEYSET CRYPT_DELETEKEYSET CRYPT_MACHINE_KEYSET CRYPT_SILENT CRYPT_EXPORTABLE CRYPT_USER_PROTECTED CRYPT_CREATE_SALT CRYPT_UPDATE_KEY CRYPT_NO_SALT CRYPT_PREGEN CRYPT_RECIPIENT CRYPT_INITIATOR CRYPT_ONLINE CRYPT_SF CRYPT_CREATE_IV CRYPT_KEK CRYPT_DATA_KEY CRYPT_VOLATILE CRYPT_SGCKEY CRYPT_ARCHIVABLE RSA1024BIT_KEY CRYPT_SERVER KEY_LENGTH_MASK CRYPT_Y_ONLY CRYPT_SSL2_FALLBACK CRYPT_DESTROYKEY CRYPT_OAEP CRYPT_BLOB_VER3 CRYPT_IPSEC_HMAC_KEY CRYPT_DECRYPT_RSA_NO_PADDING_CHECK CRYPT_SECRETDIGEST CRYPT_OWF_REPL_LM_HASH CRYPT_LITTLE_ENDIAN CRYPT_NOHASHOID CRYPT_TYPE2_FORMAT CRYPT_X931_FORMAT CRYPT_MACHINE_DEFAULT CRYPT_USER_DEFAULT CRYPT_DELETE_DEFAULT PROV_RSA_FULL PROV_RSA_SIG PROV_DSS PROV_FORTEZZA PROV_MS_EXCHANGE PROV_SSL PROV_RSA_SCHANNEL PROV_DSS_DH PROV_EC_ECDSA_SIG PROV_EC_ECNRA_SIG PROV_EC_ECDSA_FULL PROV_EC_ECNRA_FULL PROV_DH_SCHANNEL PROV_SPYRUS_LYNKS PROV_RNG PROV_INTEL_SEC PROV_REPLACE_OWF PROV_RSA_AES OBJID_WINDOW ROLE_SYSTEM_TITLEBAR ROLE_SYSTEM_MENUBAR ROLE_SYSTEM_SCROLLBAR ROLE_SYSTEM_GRIP ROLE_SYSTEM_SOUND ROLE_SYSTEM_CURSOR ROLE_SYSTEM_CARET ROLE_SYSTEM_ALERT ROLE_SYSTEM_WINDOW ROLE_SYSTEM_CLIENT ROLE_SYSTEM_MENUPOPUP ROLE_SYSTEM_MENUITEM ROLE_SYSTEM_TOOLTIP ROLE_SYSTEM_APPLICATION ROLE_SYSTEM_DOCUMENT ROLE_SYSTEM_PANE ROLE_SYSTEM_CHART ROLE_SYSTEM_DIALOG ROLE_SYSTEM_BORDER ROLE_SYSTEM_GROUPING ROLE_SYSTEM_SEPARATOR ROLE_SYSTEM_TOOLBAR ROLE_SYSTEM_STATUSBAR ROLE_SYSTEM_TABLE ROLE_SYSTEM_COLUMNHEADER ROLE_SYSTEM_ROWHEADER ROLE_SYSTEM_COLUMN ROLE_SYSTEM_ROW ROLE_SYSTEM_CELL ROLE_SYSTEM_LINK ROLE_SYSTEM_HELPBALLOON ROLE_SYSTEM_CHARACTER ROLE_SYSTEM_LIST ROLE_SYSTEM_LISTITEM ROLE_SYSTEM_OUTLINE ROLE_SYSTEM_OUTLINEITEM ROLE_SYSTEM_PAGETAB ROLE_SYSTEM_PROPERTYPAGE ROLE_SYSTEM_INDICATOR ROLE_SYSTEM_GRAPHIC ROLE_SYSTEM_STATICTEXT ROLE_SYSTEM_TEXT ROLE_SYSTEM_PUSHBUTTON ROLE_SYSTEM_CHECKBUTTON ROLE_SYSTEM_RADIOBUTTON ROLE_SYSTEM_COMBOBOX ROLE_SYSTEM_DROPLIST ROLE_SYSTEM_PROGRESSBAR ROLE_SYSTEM_DIAL ROLE_SYSTEM_HOTKEYFIELD ROLE_SYSTEM_SLIDER ROLE_SYSTEM_SPINBUTTON ROLE_SYSTEM_DIAGRAM ROLE_SYSTEM_ANIMATION ROLE_SYSTEM_EQUATION ROLE_SYSTEM_BUTTONDROPDOWN ROLE_SYSTEM_BUTTONMENU ROLE_SYSTEM_BUTTONDROPDOWNGRID ROLE_SYSTEM_WHITESPACE ROLE_SYSTEM_PAGETABLIST ROLE_SYSTEM_CLOCK ROLE_SYSTEM_SPLITBUTTON ROLE_SYSTEM_IPADDRESS ROLE_SYSTEM_OUTLINEBUTTON STATE_SYSTEM_NORMAL STATE_SYSTEM_UNAVAILABLE STATE_SYSTEM_SELECTED STATE_SYSTEM_FOCUSED STATE_SYSTEM_PRESSED STATE_SYSTEM_CHECKED STATE_SYSTEM_MIXED STATE_SYSTEM_READONLY STATE_SYSTEM_HOTTRACKED STATE_SYSTEM_DEFAULT STATE_SYSTEM_EXPANDED STATE_SYSTEM_COLLAPSED STATE_SYSTEM_BUSY STATE_SYSTEM_FLOATING STATE_SYSTEM_MARQUEED STATE_SYSTEM_ANIMATED STATE_SYSTEM_INVISIBLE STATE_SYSTEM_OFFSCREEN STATE_SYSTEM_SIZEABLE STATE_SYSTEM_MOVEABLE STATE_SYSTEM_SELFVOICING STATE_SYSTEM_FOCUSABLE STATE_SYSTEM_SELECTABLE STATE_SYSTEM_LINKED STATE_SYSTEM_TRAVERSED STATE_SYSTEM_MULTISELECTABLE STATE_SYSTEM_EXTSELECTABLE STATE_SYSTEM_ALERT_LOW STATE_SYSTEM_ALERT_MEDIUM STATE_SYSTEM_ALERT_HIGH STATE_SYSTEM_PROTECTED SELFLAG_NONE SELFLAG_TAKEFOCUS SELFLAG_TAKESELECTION SELFLAG_EXTENDSELECTION SELFLAG_ADDSELECTION SELFLAG_REMOVESELECTION NAVDIR_UP NAVDIR_DOWN NAVDIR_LEFT NAVDIR_RIGHT NAVDIR_NEXT NAVDIR_PREVIOUS NAVDIR_FIRSTCHILD NAVDIR_LASTCHILD STATUS_INFO_LENGTH_MISMATCH STATUS_SUCCESS STATUS_INVALID_PARAMETER OBJ_INHERIT DUPLICATE_CLOSE_SOURCE DUPLICATE_SAME_ACCESS DUPLICATE_SAME_ATTRIBUTES OB_TYPE_PROCESS ZwGetCurrentProcess JOB_OBJECT_ALL_ACCESS MEM_COMMIT TB_BUTTONCOUNT TB_GETBUTTON TB_DELETEBUTTON MEM_RELEASE CP_ACP PAGE_EXECUTE_READWRITE CLSID_TaskbarList IID_ITaskbarList IID_ITaskbarList2 IID_ITaskbarList3 CLSCTX_INPROC_SERVER ����������_�� ����������_��ȷ�� ����������_���� ����������_���� ����������_��ͣ WM_NULL WM_DESTROY MSGFLT_ADD WM_COMMAND WM_COPY WM_SETICON WM_DRAWCLIPBOARD WM_CHANGECBCHAIN THBN_CLICKED ����ͼ��ť����_ͼƬ���� ����ͼ��ť����_ͼ���� ����ͼ��ť����_��ʾ�ı� ����ͼ��ť����_��ť��� ����ͼ��ť_���� ����ͼ��ť_��ֹ ����ͼ��ť_����ر� ����ͼ��ť_�ޱ��� ����ͼ��ť_���� ����ͼ��ť_�޽�����ť GMEM_ZEROINIT MN_GETHMENU WM_ENTERIDLE MSGF_MENU MF_SEPARATOR MF_STRING WM_CONTEXTMENU WM_NCHITTEST MF_BYPOSITION MF_POPUP HTVSCROLL FILE_SUPPORTS_SPARSE_FILES FSCTL_SET_SPARSE FILE_ATTRIBUTE_SPARSE_FILE GENERIC_READ_ FILE_SHARE_READ FILE_SHARE_WRITE OPEN_EXISTING FEATURE_DISABLE_NAVIGATION_SOUNDS SET_FEATURE_ON_PROCESS FORMAT_MESSAGE_FROM_SYSTEM FORMAT_MESSAGE_IGNORE_INSERTS TCM_FIRST CCM_FIRST CCM_GETUNICODEFORMAT CCM_SETUNICODEFORMAT TCM_ADJUSTRECT TCM_DELETEALLITEMS TCM_DELETEITEM TCM_DESELECTALL TCM_GETCURFOCUS TCM_GETCURSEL TCM_GETEXTENDEDSTYLE TCM_GETIMAGELIST TCM_GETITEMA TCM_GETITEMCOUNT TCM_GETITEMRECT TCM_GETROWCOUNT TCM_GETTOOLTIPS TCM_GETUNICODEFORMAT TCM_HIGHLIGHTITEM TCM_HITTEST TCM_INSERTITEMA TCM_REMOVEIMAGE TCM_SETCURFOCUS TCM_SETCURSEL TCM_SETEXTENDEDSTYLE TCM_SETIMAGELIST TCM_SETITEMA TCM_SETITEMEXTRA TCM_SETITEMSIZE TCM_SETMINTABWIDTH TCM_SETPADDING TCM_SETTOOLTIPS TCM_SETUNICODEFORMAT TCIF_IMAGE TCIF_PARAM TCIF_RTLREADING TCIF_STATE TCIF_TEXT WM_MEASUREITEM WM_WINDOWPOSCHANGED LVS_OWNERDRAWFIXED CF_LIMITSIZE HWND_TOP SWP_NOMOVE SWP_NOSIZE SWP_NOACTIVATE HWND_TOPMOST HWND_NOTOPMOST WS_EX_LAYERED WS_EX_TRANSPARENT WS_EX_NOACTIVATE WM_MBUTTONDBLCLK WM_RBUTTONUP WM_MBUTTONUP WM_MBUTTONDOWN WM_RBUTTONDBLCLK WM_RBUTTONDOWN WM_LBUTTONDBLCLK WM_LBUTTONUP WM_LBUTTONDOWN WM_MOUSEWHEEL DWM_BB_ENABLE DWM_BB_BLURREGION DWM_BB_TRANSITIONONMAXIMIZED DWMWA_NCRENDERING_ENABLED DWMWA_NCRENDERING_POLICY DWMWA_TRANSITIONS_FORCEDISABLED DWMWA_ALLOW_NCPAINT DWMWA_CAPTION_BUTTON_BOUNDS DWMWA_NONCLIENT_RTL_LAYOUT DWMWA_FORCE_ICONIC_REPRESENTATION DWMWA_FLIP3D_POLICY DWMWA_EXTENDED_FRAME_BOUNDS DWMWA_LAST DWMNCRP_USEWINDOWSTYLE DWMNCRP_DISABLED DWMNCRP_ENABLED DWMNCRP_LAST DWMFLIP3D_DEFAULT DWMFLIP3D_EXCLUDEBELOW DWMFLIP3D_EXCLUDEABOVE DWMFLIP3D_LAST DWM_TNP_RECTDESTINATION DWM_TNP_RECTSOURCE DWM_TNP_OPACITY DWM_TNP_VISIBLE DWM_TNP_SOURCECLIENTAREAONLY DWM_SOURCE_FRAME_SAMPLING_POINT DWM_SOURCE_FRAME_SAMPLING_COVERAGE DWM_SOURCE_FRAME_SAMPLING_LAST DWM_EC_DISABLECOMPOSITION DWM_EC_ENABLECOMPOSITION ��λ_�������� ��λ_Display ��λ_���� ��λ_�� ��λ_Ӣ�� ��λ_Document ��λ_���� ���ظ�ʽ_Indexed ���ظ�ʽ_GDI ���ظ�ʽ_Alpha ���ظ�ʽ_PAlpha ���ظ�ʽ_Extended ���ظ�ʽ_Canonical ���ظ�ʽ_Undefined ���ظ�ʽ_DontCare ���ظ�ʽ_1bppIndexed ���ظ�ʽ_4bppIndexed ���ظ�ʽ_8bppIndexed ���ظ�ʽ_16bppGrayScale ���ظ�ʽ_16bppRGB555 ���ظ�ʽ_16bppRGB565 ���ظ�ʽ_16bppARGB1555 ���ظ�ʽ_24bppRGB ���ظ�ʽ_32bppRGB ���ظ�ʽ_32bppARGB ���ظ�ʽ_32bppPARGB ���ظ�ʽ_48bppRGB ���ظ�ʽ_64bppARGB ���ظ�ʽ_64bppPARGB ���ظ�ʽ_Max ����_����ҳ��ʶ�� SB_CTL SB_HORZ SB_VERT SIF_DISABLENOSCROLL SIF_PAGE SIF_POS SIF_TRACKPOS SIF_RANGE SIF_ALL OBJID_VSCROLL LVM_APPROXIMATEVIEWRECT LVM_ARRANGE LVM_CREATEDRAGIMAGE LVM_DELETEALLITEMS LVM_DELETECOLUMN LVM_DELETEITEM LVM_EDITLABELW LVM_ENABLEGROUPVIEW LVM_ENSUREVISIBLE LVM_FINDITEMW LVM_GETBKCOLOR LVM_GETBKIMAGEW LVM_GETCALLBACKMASK LVM_GETCOLUMNW LVM_GETCOLUMNORDERARRAY LVM_GETCOLUMNWIDTH LVM_GETCOUNTPERPAGE LVM_GETEDITCONTROL LVM_GETEXTENDEDLISTVIEWSTYLE LVM_GETGROUPINFO LVM_GETGROUPCOUNT LVM_GETGROUPINFOBYINDEX LVM_GETGROUPMETRICS LVM_GETHEADER LVM_GETHOTCURSOR LVM_GETHOTITEM LVM_GETHOVERTIME LVM_GETIMAGELIST LVM_GETINSERTMARK LVM_GETINSERTMARKCOLOR LVM_GETINSERTMARKRECT LVM_GETITEMW LVM_GETITEMCOUNT LVM_GETITEMPOSITION LVM_GETITEMRECT LVM_GETITEMSPACING LVM_GETITEMSTATE LVM_GETITEMTEXTW LVM_GETNEXTITEM LVM_GETNUMBEROFWORKAREAS LVM_GETOUTLINECOLOR LVM_GETSELECTEDCOLUMN LVM_GETSELECTEDCOUNT LVM_GETSELECTIONMARK LVM_GETSTRINGWIDTHA LVM_GETSUBITEMRECT LVM_GETTEXTBKCOLOR LVM_GETTEXTCOLOR LVM_GETTOOLTIPS LVM_GETTOPINDEX LVM_GETVIEW LVM_GETVIEWRECT LVM_GETWORKAREAS LVM_INSERTCOLUMNW LVM_INSERTGROUP LVM_INSERTGROUPSORTED LVM_INSERTITEMW LVM_ISGROUPVIEWENABLED LVM_MOVEITEMTOGROUP LVM_REDRAWITEMS LVM_REMOVEALLGROUPS LVM_SCROLL LVM_SETBKCOLOR LVM_SETBKIMAGEW LVM_SETCALLBACKMASK LVM_SETCOLUMNW LVM_SETCOLUMNORDERARRAY LVM_SETCOLUMNWIDTH LVM_SETEXTENDEDLISTVIEWSTYLE LVM_SETGROUPINFO LVM_SETHOTITEM LVM_SETICONSPACING LVM_SETIMAGELIST LVM_SETINFOTIP LVM_SETINSERTMARK LVM_SETINSERTMARKCOLOR LVM_SETITEMW LVM_SETITEMCOUNT LVM_SETITEMPOSITION LVM_SETITEMSTATE LVM_SETITEMTEXTA LVM_SETOUTLINECOLOR LVM_SETSELECTEDCOLUMN LVM_SETSELECTIONMARK LVM_SETTEXTBKCOLOR LVM_SETTEXTCOLOR LVM_SETTOOLTIPS LVM_SETVIEW LVM_SETWORKAREAS LVM_SORTGROUPS LVM_SORTITEMS LVM_SORTITEMSEX LVM_UPDATE LVM_SUBITEMHITTEST LVM_CANCELEDITLABEL LVM_INSERTMARKHITTEST LVM_SETITEMPOSITION32 ���ڷ��_���߿� ���ڷ��_������ ���ڷ��_�Ӵ��� ���ڷ��_�ų��Ӵ����ػ� ���ڷ��_�ų��ص������ػ� ���ڷ��_��ֹ ���ڷ��_�Ի���߿� ���ڷ��_����ʽ ���ڷ��_ˮƽ������ ���ڷ��_���״̬ ���ڷ��_��󻯰�ť ���ڷ��_��С��״̬ ���ڷ��_��С����ť ���ڷ��_Ĭ�� ���ڷ��_����ʽ���� ���ڷ��_�ɵ��߿� ���ڷ��_ϵͳ�˵� ���ڷ��_��ͣ������ ���ڷ��_������� ���ڷ��_���� ���ڷ��_��ֱ������ ���ڷ��_�ޱ߿� ������չ_��Ӱ��Ե ������չ_˫��߿� ������չ_͹����Ӱ ������չ_��ά��Ե ������չ_͹��߿� ������չ_�������� ������չ_�ֲ� ������չ_������ǰ ������չ_���������� ������չ_�ɽ����Ϸ� ������չ_����������ʾ ������չ_������ť ������չ_��ֱ���������� ������չ_MDI�Ӵ��� ������չ_�Ҷ��� ������չ_�ı����ҵ��� ������չ_͸�� CB_ADDSTRING CB_DELETESTRING CB_ERR CB_FINDSTRING CB_FINDSTRINGEXACT CB_GETCOUNT CB_GETCURSEL CB_GETDROPPEDCONTROLRECT CB_GETDROPPEDSTATE CB_GETDROPPEDWIDTH CB_GETEDITSEL CB_GETEXTENDEDUI CB_GETITEMDATA CB_GETITEMHEIGHT CB_GETLBTEXT CB_GETLBTEXTLEN CB_GETTOPINDEX CB_INSERTSTRING CB_LIMITTEXT CB_RESETCONTENT CB_SELECTSTRING CB_SETCURSEL CB_SETDROPPEDWIDTH CB_SETEDITSEL CB_SETEXTENDEDUI CB_SETHORIZONTALEXTENT CB_SETITEMDATA CB_SETITEMHEIGHT CB_SETTOPINDEX CB_SHOWDROPDOWN CB_GETCOMBOBOXINFO FILE_ATTRIBUTE_NORMAL CSIDL_DESKTOP CSIDL_INTERNET CSIDL_PROGRAMS CSIDL_CONTROLS CSIDL_PRINTERS CSIDL_PERSONAL CSIDL_FAVORITES CSIDL_STARTUP CSIDL_RECENT CSIDL_SENDTO CSIDL_BITBUCKET CSIDL_STARTMENU CSIDL_MYMUSIC CSIDL_DESKTOPDIRECTORY CSIDL_DRIVES CSIDL_NETWORK CSIDL_NETHOOD CSIDL_FONTS CSIDL_TEMPLATES CSIDL_COMMON_STARTMENU CSIDL_COMMON_PROGRAMS CSIDL_COMMON_STARTUP CSIDL_COMMON_DESKTOPDIRECTORY CSIDL_APPDATA CSIDL_PRINTHOOD CSIDL_LOCAL_APPDATA CSIDL_ALTSTARTUP CSIDL_COMMON_ALTSTARTUP CSIDL_COMMON_FAVORITES CSIDL_INTERNET_CACHE CSIDL_COOKIES CSIDL_HISTORY CSIDL_COMMON_APPDATA CSIDL_WINDOWS CSIDL_SYSTEM CSIDL_PROGRAM_FILES CSIDL_MYPICTURES CSIDL_PROFILE CSIDL_SYSTEMX86 CSIDL_PROGRAM_FILESX86 CSIDL_PROGRAM_FILES_COMMON CSIDL_PROGRAM_FILES_COMMONX86 CSIDL_COMMON_TEMPLATES CSIDL_COMMON_DOCUMENTS CSIDL_COMMON_ADMINTOOLS CSIDL_ADMINTOOLS CSIDL_CONNECTIONS MOD_ALT MOD_CONTROL MOD_SHIFT ���ָ��_��׼�� ���ָ��_�ı��༭�� ���ָ��_ɳ©�� ���ָ��_ʮ���� ���ָ��_UPARROW ���ָ��_SIZENWSE ���ָ��_SIZENESW ���ָ��_SIZEWE ���ָ��_SIZENS ���ָ��_�����ͷ ���ָ��_��ֹ�� ���ָ��_���� ���ָ��_APPSTARTING ���ָ��_���� HOOK״̬_�ɹ� HOOK״̬_�޸��ڴ汣��ʧ�� HOOK״̬_��HOOK HOOK״̬_��HOOK��ַΪ0 HOOK״̬_��ȡ�ڴ�ʧ�� HOOK״̬_д���ڴ�ʧ�� HOOK״̬_����Զ���ڴ�ʧ�� CF_TEXT CF_BITMAP CF_METAFILEPICT CF_SYLK CF_DIF CF_TIFF CF_OEMTEXT CF_DIB CF_PALETTE CF_PENDATA CF_RIFF CF_WAVE CF_UNICODETEXT CF_ENHMETAFILE CF_HDROP MAX_PATH LOCALE_INVARIANT IfOperStatusUp IfOperStatusDown IfOperStatusTesting IfOperStatusUnknown IfOperStatusDormant IfOperStatusNotPresent IfOperStatusLowerLayerDown KEYCODE_LBUTTON KEYCODE_RBUTTON KEYCODE_MBUTTON KEYCODE_WHEEL KEYCODE_SIDEKEYUP KEYCODE_SIDEKEYDOWN KEYSTATUS_DOWN KEYSTATUS_UP KEYSTATUS_DBLCLK KEYSTATUS_WHEELUP KEYSTATUS_WHEELDOWN _WIN32_WINNT_WINXP _WIN32_WINNT_VISTA _WIN32_WINNT_WIN7 _WIN32_WINNT_WIN8 _WIN32_WINNT_WINBLUE _WIN32_WINNT_WIN10 HOTKEYF_SHIFT HOTKEYF_CONTROL HOTKEYF_ALT HOTKEYF_EXT CRYPT_STRING_BASE64 CRYPT_STRING_HEX CRYPT_STRING_HEXRAW CRYPT_STRING_NOCRLF CRYPT_STRING_NOCR VK_LSHIFT VK_RSHIFT VK_LCONTROL VK_RCONTROL VK_LMENU VK_RMENU INPUT_KEYBOARD KEYEVENTF_KEYUP FMTID_AudioSummaryInformation FMTID_Volume FMTID_SummaryInformation FMTID_DocumentSummaryInformation FMTID_ShellDetails PSGUID_MEDIAFILESUMMARYINFORMATION FMTID_Storage FMTID_ImageProperties PSFMTID_VERSION FMTID_Misc FMTID_Query FMTID_IntSite FMTID_DRM PSGUID_IMAGESUMMARYINFORMATION PSGUID_LINK FMTID_MUSIC FMTID_WebView FMTID_VideoSummaryInformation System_AppUserModel SeDebugPrivilege GRANT_ACCESS SET_ACCESS DENY_ACCESS ��ͨ��� �ⲿ���Ϳ� �ⲿ�ؼ����� ��_ϵͳ���� �ļ��Ϸ� ע������� �ⲿ�����б��� �ڴ湲�� ADSL������ �������ʽ�� ��_XMLHTTP ��_ͼƬ������� �ֽ��� ����� ���뷨�� ��_APIHOOK ��_�ű���� ��_�ڴ� ��_ʶͼ ��_λͼ���� ��_λͼ���� ��_ODBC���ݿ� ��_���� ��_�̳߳� ��_FTP ��_json ��_�ڴ������� ע�������Ex ��_������ ��_CPU��Ϣ ��_ϵͳ��Ϣ ��_ͨ�öԻ��� ��_������ ��_������ȡ ��_ʱ�� ��_���� ��_������Ϣ ��_�ʲ۷���� ��_�ʲۿͻ��� ��_��־��� ��_Accessible ��_POST������ ��_POST������_�ֽڼ� ��_���� ��_�����ı� ��_������ex ��_Cookie ��_ģ��ö�� ��_HTMLʵ�� HashMap_StrInt ��_RegExp ��_���������� ��_�༭��˵� ��_�ⲿѡ��� ��_�����б��� ��_���洰�ڹ��� ��_������ ��_ͼ���ʽת���� ��_HOOK_Send ��_�༭��͸�� ��_HOOK_EX ��_���Ϳ�_�ֽڼ����� ��_DOM ��_DOM_���� ��_�ⲿ״̬�� ��_InlineHook ��_ϵͳ���� ��_���β˵� HTTP_Proxy ���߳�DD __HIDDEN_TEMP_MOD__ ��ʼ�� ��ҳ_ȡ�ĵ����� ���� ��ҳ_ȡIE���ھ�� ��ҳ_ȡ��ҳ�ĵ����� �ؼ�_�������Բ����� �ؼ�_�ñ�� ���_ȡ���� ��ҳ_��ת ��ҳ_��ת1 ��ҳ_���� ��ҳ_ȡ�ı� ��ҳ_ȡԴ�� ��ҳ_ȡ���� ��ҳ_ִ�нű� ��ҳ_�����ҳ���� ��ҳ_ִ���¼� ��ҳ_ˢ�� ��ҳ_ȡ���� ��ҳ_������ ��ҳ_�޸� ��ҳ_ȡ����Ԫ�� ��ҳ_ȡԪ������ ��ҳ_ȡ�������� ��ҳ_ȡҳ���ַ ��ҳ_ȡ�������� ��ҳ_ȡѡ������ ��ҳ_������Ϣ�� ��ҳ_ȡҳ���С ��ҳ_���ع����� ��ҳ_���������� ��ҳ_�������̶� ��ҳ_������ȡλ�� ��ҳ_������ȡ�߿� ��ҳ_�滻ѡ������ ��ҳ_��������ҳ ��ҳ_�����ؼ��� �ı���_ȡ���� �ı���_ȡ���� �ı���_ȡ���� �ı���_ȡ���� �ı���_ȡ���� �ı���_д���� �ı���_�ý��� �ļ���_д���� �����ı���_�ý��� �����ı���_��״̬ �����ı���_ȡ���� �����ı���_ȡ���� �����ı���_ȡ���� �����ı���_ȡ���� �����ı���_д���� ��ѡ��_ȡ���� ��ѡ��_ȡ״̬ ��ѡ��_ȡ���� ��ѡ��_ȡ���� ��ѡ��_ȡ���� ��ѡ��_ѡ�� ��ѡ��_ȡ��ѡ�� ��ѡ��_�ý��� ��ѡ��_��״̬ ��ѡ��_ȡ���� ��ѡ��_ȡ״̬ ��ѡ��_ȡ���� ��ѡ��_ȡ���� ��ѡ��_ȡ���� ��ѡ��_ѡ�� ��ѡ��_ȡ��ѡ�� ��ѡ��_�ý��� ��ѡ��_��״̬ ��ť_ȡ���� ��ť_ȡ���� ��ť_ȡ���� ��ť_ȡ���� ��ť_�ý��� ��ť_��״̬ ��ť_��� �߼���ť_ȡ���� �߼���ť_ȡ���� �߼���ť_ȡ���� �߼���ť_ȡ���� �߼���ť_��� �߼���ť_ȡԴ�� �߼���ť_�ý��� �߼���ť_��״̬ ͼ�ΰ�ť_ȡ���� ͼ�ΰ�ť_ȡ���� ͼ�ΰ�ť_ȡ���� ͼ�ΰ�ť_ȡ���� ͼ�ΰ�ť_��� ͼ�ΰ�ť_ȡԴ�� ͼ�ΰ�ť_�ý��� ����_ȡ���� ����_ȡ���� ����_ȡ���� ����_ȡ���� ����_��� ����_ȡԴ�� ����_ȡ���� ����_�ý��� ����_��״̬ ����_ö�� ��ҳ_��֤��ͬ�� ͼƬ_��� ͼƬ_ȡ���� ͼƬ_ö�� ͼƬ_ȡ���� ͼƬ_ȡ���� ͼƬ_ȡ���� ͼƬ_��״̬ ��Ͽ�_ȡ�������� ��Ͽ�_ȡ���� ��Ͽ�_ȡ��Ŀ�� ��Ͽ�_ȡ��Ŀ�ı� ��Ͽ�_����Ŀ�ı� ��Ͽ�_ȡ��Ŀ��ֵ ��Ͽ�_����Ŀ��ֵ ��Ͽ�_ȡ����ѡ���� ��Ͽ�_������ѡ���� ��Ͽ�_����Ŀ�ı�ѡ�� ��Ͽ�_�ý��� ��Ͽ�_��״̬ ����_ȡ���� ����_ȡ�ı� ����_ȡԴ�� ����_ȡ���� ����_ȡ���� ����_ȡ��Ԫ���ı� ����_�õ�Ԫ���ı� ����_ȡ��Ԫ��Դ�� ����_ȡ��Ԫ������ ����_ȡ���� ����_�ύ ����_ȡ���� ����_ȡԴ�� ����_ȡ���� ����_ȡ��Ϣ ���ر���_ȡ���� ���ر���_ȡ���� ���ر���_ȡ���� ���ر���_ȡ���� ���ر���_ȡ���� ���ر���_д���� DIV_ȡ���� DIV_ȡ���� DIV_ȡ���� DIV_ȡ���� DIV_д���� DIV_ȡԴ�� DIV_ȡ���� DIV_��� DIV_��״̬ ULLI_ȡ���� ULLI_ȡ���� ULLI_ѡ�� ULLI_ȡԴ�� SPAN_ȡ���� SPAN_��� SPAN_ȡ���� SPAN_ȡ���� SPAN_ȡ���� SPAN_ȡ���� SPAN_ȡԴ�� SPAN_д���� SPAN_��״̬ ��ҳ_���ΰ�ȫ���� �����ж�_�ı��ؼ��� �����ж�_Դ��ؼ��� ��ʼ�� ȡ��Ŀ�� ȡ��Ŀ������� ȡ������� ȡ�������_��� ȡ��Ŀ�ı� ȡ��Ŀ�ı�W ȡ��Ŀ�ı�_���W ȡ��Ŀ�ı�_��� ȡͼƬ ȡͼƬ_��� ȡѡ��ͼƬ ȡ��Ŀ��ֵ ȡ��Ŀ��ֵ_��� ��ͼƬ ��ѡ��ͼƬ ����Ŀ��ֵ ����Ŀ�ı�W ����Ŀ�ı� ��֤��ʾ ��֤��ʾ_��� ��չ ��չȫ�� ���� ����ȫ�� ǿ��ˢ�� ���� ����_��� ������Ŀ ������ĿW ɾ����Ŀ ��� ȡ����Ŀ ȡ����Ŀ�ı� �Ƿ�������Ŀ �Ƿ�����չ �ñ���ɫ ȡ����ɫ ����Ŀ��� ȡ��Ŀ��� ���ı���ɫ ȡ�ı���ɫ ��������ɫ ȡ������ɫ ʹ�ø�ѡ�� ʹ���ȵ���� ��ֹ������ ��ֹˮƽ������ ʹ������ѡ�� �Ƿ�ѡ�� ѡ����Ŀ �Ӵ� �Ӵ�_��� ȡ���Ӵ� ȡ����ʾ���� ȡ��һ������ ȡ����ѡ���� ������ѡ���� ������ѡ����_��� ȡȫ��ѡ���� ���»��� ���ⲿ���� �������_����Ŀ ���ȡ���� ����ȡ��� ������Ŀ ������Ŀ��ֵ ������Ŀ_�ⲿ ȡ����Ŀ�� ˫����Ŀ ȡ���и���Ŀ ȡ��һ��ͬ����Ŀ ȡ��һ��ͬ����Ŀ �������� �򿪽��� д�����ڴ� �����ⲿָ�� �����ⲿָ�� ���ⲿָ������ ȡ����״̬ ȡ�������� ȡ�������� �÷������� ȡ��ʾ���� ȡ�������� ��װ���� ж�ط��� ��ʼ���� ֹͣ���� ��ͣ���� �ָ����� �Ƿ���� ���������� ȡ�������� ȡ�ļ�·�� ���ļ�·�� ȡ��¼���� ö�ٷ��� ȡ������ ȡָ��������Ϣ ö�ٷ���Ex �������� �ϷŶ���_ע�� �ϷŶ���_���� ö������ ö�ټ��� ȡ�������� �Ƿ���� ˢ���� д�ֽڼ� ȡ�ֽڼ� дע����Ex дDWORDֵ ȡDWORDֵ д������ֵ ȡ������ֵ д�ַ���ֵ ȡ�ַ���ֵ д���ַ���ֵ ȡ���ַ���ֵ д�������ַ���ֵ ȡ�������ַ���ֵ ɾ���� ɾ������ ȡ�ַ���ֵ_CMD �������� ��ʼ�� ȡ���� ȡͼƬ ȡ��ǰ״̬ͼƬ ȡ������Ŀ ȡ������ ȡ������ֵ �ñ��� ��ͼƬ ��״̬ͼƬ ��������Ŀ �ñ�����ֵ ȡ��ѡ����� ȡ��ѡ�б��� ȡ��ѡ������� �Ƿ�ѡ�� ѡ����� ȡ������ѡ�� ������� ���ٲ������ ɾ������ ȫ��ɾ�� ���ұ��� ���ұ�����ֵ ��֤��ʾ ����ͼ�� ȡ�б��� ȡ�ж��뷽ʽ ȡ�п� ȡ��ͼƬ ͼƬ�Ƿ���� ���б��� ���п� ����ͼƬ ȡ���� ������ ɾ���� ����༭ �������б�����Ŀ���� ȡ�ı���ɫ ���ı���ɫ ˢ����ʾ ȡ��һ������ ȡ����ʾ���� ȡ�ı�������ɫ ���ı�������ɫ ȡ������ɫ �ñ�����ɫ ȡ���� ������ ȡ����ͼƬ �ñ���ͼƬ ȡ���ָ�����ڵ����� ȡ��Ŀ�о� ȡ�༭���� ȡ������ ������ ��һѡ�� ȡ����ѡ���� ������ѡ���� ����Excel _���ⲿ���� _�����ⲿ���� ȡ����λ�� ���� д�� ��ȡ �ͷ� ȡ�ڴ泤�� ȫ���ͷ� _ȡ����IP ȡ����IP �ز� ���� �Ͽ� �ز�_cmd ����_cmd �Ͽ�_cmd ȡ�������� ȡ�������� ȡ����״̬ �����Ƿ���� �Ͽ��������� �����²������� ���ò������� ɾ���������� ȡ�����û������� ���� �鿴 ȡ�����ı� �滻 ȡƥ������ ȡƥ���ı� ȡ��ƥ���ı� ȡ��ƥ������ �� ָ������ͷ���� ȡ��Ӧͷ���� ȡ����ͷ���� �������� ȡ����ǰ���� ȡ״̬�� ȡ״̬�ı� ȡresponseXML ȡresponseText ȡ��Ӧ���� ȡresponseStream ȡreadyState ��onreadystatechange ����ͼƬ�� ����ͼƬ�� ɾ��ͼ�� ��� ȡͼƬ��ߴ� ȡͼƬ��ͼ���� ��ͼƬ��ͼ��ߴ� ��ͼƬ��ͼ���� ȡͼƬ�鱳����ɫ ��ͼƬ�鱳����ɫ ȡͼƬ���� ��ͼƬ���� �滻ͼ�� �滻λͼ ����ͼƬ�� ����ͼƬ�� ȡͼ����_���ļ� ȡͼƬ���_���ļ� ȡͼƬ���_���ֽڼ� ����ͼ��_���ֽڼ� ����λͼ_���ļ� ����λͼ_�Ӿ�� ����ͼ��_���ļ� ����ͼ��_�Ӿ�� �����ֽ��� �ͷ��ֽ��� ȡ�ֽ���ָ�� ȡ�ֽ����ߴ� ȡ���ֽڼ� ȡ������ַ ���ӳ���ָ�� תΪʮ������ ��������� ȡ�������� ���л����� ת��ʮ������ ADD_EAX_EDX MOV_EAX_PTR PUSH_�γ��� POP_ECX POP_EBP JMP_EAX CALL_EAX RET_������ MOV_EDX_EAX MOV_EBP_ESP MOV_EAX_PTR_EBP���ֽ� ADD_EAX_���� SUB_EAX_���� IMUL_EAX_���� IDIV_ECX CMP_PTR_���� SHL_EAX_���� SHR_EAX_���� PUSHAD PUSH_EAX POP_EAX POPAD PUSH_EBX PUSH_ECX PUSH_EDX PUSH_ESI PUSH_EDI PUSH_EBP PUSH_ESP PUSH_���� MOV_EAX_���� MOV_EBX_���� MOV_ECX_���� MOV_EDX_���� MOV_ESI_���� MOV_EDI_���� MOV_EBP_���� MOV_ESP_���� MOV_EAX_PRT MOV_EBX_PRT MOV_ECX_PRT MOV_EDX_PRT MOV_ESI_PRT MOV_EDI_PRT MOV_EBP_PRT MOV_ESP_PRT MOV_PRT_EAX MOV_PRT_EBX MOV_PRT_ECX MOV_PRT_EDX MOV_PRT_ESI MOV_PRT_EDI MOV_PRT_EBP MOV_PRT_ESP JMP CALL_EBX CALL RET ADD_EBX_EAX ADD_EBX_PTR ADD_EBX_�ֽ� ADD_ECX_���� ADD_EDX_�ֽ� ADD_ESI_���� ADD_ESP_�ֽ� AND_EAX_���� CALL_PTR CMP_EAX_EDX CMP_EAX_PTR CMP_EAX_���� DEC_EAX DEC_EBX DEC_ECX DEC_EDX IDIV_EBX IMUL_EAX_EDX IN_AL_DX IN_AL_�˿ں� IN_AX_DX IN_AX_�˿ں� INC_EAX INC_ECX INC_EDI INC_ESI INC_PTR INC_PTR_EAX INC_PTR_EDX LEA_EAX_PTR_EAX���ֽ� LEA_ECX_PTR_EAX������ LEA_ECX_PTR_ESI���ֽ� LEA_ECX_PTR_ESP���ֽ� LEAVE MOV_EAX_EBX MOV_EAX_EDX MOV_EAX_ESI MOV_EAX_PTR_DS���� MOV_EAX_PTR_EAX MOV_EAX_PTR_EAX������ MOV_EAX_PTR_EAX���ֽ� MOV_EAX_PTR_EBX MOV_EAX_PTR_EDX MOV_EAX_PTR_EDX���ֽ� MOV_EAX_PTR_ESP���ֽ� MOV_EBX_EAX MOV_EBX_EDX MOV_EBX_PTR_EAX���ֽ� MOV_ECX_EAX MOV_ECX_EDI MOV_ECX_ESI MOV_ECX_PTR MOV_ECX_PTR_EAX���ֽ� MOV_ECX_PTR_EBX������ MOV_ECX_PTR_ECX���ֽ� MOV_ECX_PTR_EDX���ֽ� MOV_EDI_EAX MOV_EDX_PTR_ECX���ֽ� MOV_EDX_PTR_EDI������ MOV_EDX_PTR_EDI���ֽ� MOV_ESI_EAX MOV_ESI_EBX MOV_ESI_PTR MOV_ESI_PTR_EBP���ֽ� MOV_ESP_EBP MOV_PTR_EAX MOV_PTR_EBX_EAX MOV_PTR_ECX���ֽ�_EAX MOV_PTR_EDX_EAX MOV_PTR_���� NOP NOT_EAX OUT_DX_AL OUT_�˿ں�_AX POP_EBX POP_EDX POP_ESI PUSH_PTR SHL_EBX_���� SHR_EBX_���� SUB_EAX_PTR SUB_EBX_EAX SUB_EDX_�ֽ� TEST_EAX_EAX TEST_EAX_���� XOR_EAX_EBX XOR_EDI_EDI ��װ ж�� ȡ��� ȡȫ�����뷨��� ע�� ֹͣע�� ���� ȡ���� ȡ��� ȡ���뷨���� ��ʾ���� ��װ ���� �Ƿ��Ѱ�װ ��ͣ ȡ��ַ ж�� ж��ȫ�� ִ�� �������ʽ ��� ȡ���� ȡ�ű����� ���� ����_���� ����_��ʱ ������ ȡ���� ���� ��С�� дС�� ���ı� ���ı�1 д�ı� ������ ������1 �������� ��������1 �������� ��������1 д���� ���ֽ� д�ֽ� ���ֽڼ� д�ֽڼ� ������ʱ�� ���ӳ���ָ�� ��˫����С�� д���� ������_���� ������_�ֽڼ� ���ֽڼ�_64 д�ֽڼ�_64 ������Χ ��ͼ_�Ӿ�� ��ͼ_���ֽڼ� ����_��ʼ�� ���� ����_���ֽڼ� ����_���� ȡɫ ��ɫ �����ݴ��� �����ݴ���2 ���ļ����� ��λͼ������� ��ͼ�������� ����Ļ���� �Ӵ��ڴ��� �ӳ������� �Ӽ����崴�� �����հ�λͼ ����λͼ ת��λ��� ���Ƶ� ȡλͼ��� ȡ������� ȡ���� ȡ�߶� ȡλ��� ȡ����2 ȡ�߶�2 ȡλ���2 ȡָ�� ȡ��ɫ�����ַ ȡ��ɫ�����С ȡ��ɫ��ָ�� ȡ��ɫ����С ȡ���ֽ��� ȡ��λͼ���� ȡ����ɫ���� ȡĳ����ɫ ��ĳ����ɫ �ü�����λͼ �ô���λͼ ȡλͼ��ɫ ��λͼ��ɫ ȡλͼ��ɫ�� ��ɫ������λͼ λͼȥ�ӵ� λͼ���� λͼת��λ�� λͼ��ֵ�� λͼ��ɫ ȡλͼ����ͼ λͼϸ�� λͼ�ָ�1 λͼ�ָ�2 ȡλͼ��Ч��Χ ȡ���ݿ��� �����ݿ��� ���� ����SQLServer ����Access �ر� ִ��SQL ִ�� ��ѯ ��SQL��� ִ�м�¼�� �󶨲��� �ͷż�¼�� ����һ�� ����һ�� ���׼�¼ ��β��¼ �Ƶ� ���ֶ��ı� ���ֶ��ֽڼ� ���ֶ����� ���ֶε����� ���ֶ�˫���� ���ı� ���ֽڼ� ������ �������� ��˫���� ȡ�ֶ��� ȡ�ֶ��� ȡ�ֶ����� ȡ�ֶζ��峤�� �ֶ��Ƿ�ɿ� ȡ��¼�� ��ʼ���� �ع����� �ύ���� �賬ʱʱ�� ȡ��ʱʱ�� ȡ������ ö��SQL������ ö��SQL���ݿ� ��װ����_���� ж�� ��װ����_��� ���� ���빤�� �ر� ȡ״̬ �Ƿ������� ����FTP������ �Ͽ�FTP������ Ŀ¼���� Ŀ¼ɾ�� Ŀ¼���� Ŀ¼�ϴ� Ŀ¼�б� ������Ŀ¼ ȡ����Ŀ¼ �ļ�ɾ�� �ļ����� �ļ����� �ļ��ϴ� �ļ�ȡ��С Ŀ¼ȡ��С �ļ�ȡ���� Ŀ¼ȡ���� �ļ�ȡʱ�� Ŀ¼ȡʱ�� �ļ��Ƿ���� Ŀ¼�Ƿ���� �������� ���� ��� ȡ�����ı� ������ �����Զ��� �����Ƿ���� ȡ���� ȡͨ������ ȡ���������� ��Ա�� ȡ���� �ӳ�Ա ȡ��Ա ȡ��Ա�ı� �ó�Ա ɾ��Ա ɾ���� ��������ֵ ȡ������ֵ ȡ���Զ��� ȡ�ض��� ȡ��������ֵ д������ �������� ��������_���� ɾ�������� ��� ȡ���������� ȡ�������� ȡ���ý��� ����������_���ļ� ����������_���ڴ� ȡ�������� д���ļ� �رռ�Ex �򿪼�Ex �������򿪼�Ex ö������Ex ����_ȡ���������Ex ö�ټ���ϢEx ���Ƿ����Ex ��ȡ��ֵEx д���ֵEx_�ı� д���ֵEx_��ֵ дQWORD_64ֵ ɾ����ֵEx ɾ��ע����� ��ʽ����ֵ���� �Ƿ�������Ex д��� ��ȡ�� ö�ٽ� ȡ���� ɾ���� �����ı� д���ı� ɾ���� ö���� ȡ���� ������ֵ д��ṹ ����ṹ дϵͳ�� ��ϵͳ�� ö��ϵͳ�� ȡϵͳ���� ��ϵͳ���ı� дϵͳ���ı� ��ϵͳ����ֵ ȡ��ַ���� ȡ�ܹ� ȡ״̬ ȡ��ǰʱ���ٶ� ȡ��ǰ��ѹ ȡ���ݿ��� ȡ���� ȡ�豸��� ȡ�������� ȡ�������� ȡռ���� ȡ������ ���ʱ���ٶ� ȡ���� ȡ�ͺ� ȡ������ ȡ�߳��� ȡ���к� ȡ���������� ȡ�޶��� ȡ�������� ȡ�����豸 ȡ�ڲ��汾���� ȡ���� ȡ���뼯 ȡ���Ҵ��� ȡ������� ȡ������ ȡ��ǰʱ�� ����ִ�б���_�Ƿ���Ч ����ִ�б���_֧��32λ���� ����ִ�б���_�豸���� ����ִ�б���_֧�ַ�ʽ �Ƿ�֧�ֵ��� ȡ���� �Ƿ�ֲ�ʽϵͳ ȡ����λ�� ǰ̨������� ȡʣ�������ڴ� ȡ����ҳ���ļ� ȡ����ϵͳ���� ȡ���������ڴ� ȡ��װ���� ȡ���ػ�ʱ�� ȡ����ʱ�� ȡ���Ի��� ȡ������ ȡ�������� ȡ�������ڴ� ȡ������԰� ȡ������ ȡ�û��Ự�� ȡϵͳSKU ȡ���� ȡϵͳλ�� ȡϵͳ���� ȡϵͳ�׼� ȡϵͳ���� �Ƿ�ΪNTϵͳ ȡ������������ PAE�Ƿ����� ȡ���Ӳ�ƷID ȡ���Ӱ汾�� �Ƿ��Яʽϵͳ �Ƿ���ϵͳ �Ƿ�Ϊ������ ȡע���û��� ȡ���к� ȡ��������汾�� ȡ������ΰ汾�� ȡ�洢�ķ�ҳ��С ȡ״̬ ȡǶ������ ȡϵͳ�豸 ȡϵͳĿ¼ ȡϵͳ�� ȡ�ܽ����ռ� ȡ�������ڴ� ȡ�������ڴ� ȡ�汾 ȡϵͳ��װĿ¼ �Ƿ�Ϊ������� �Ƿ�Ϊ����վ ȡ��ǰ�û� ȡʱ�� ȡ���ҷ��� ȡ���ڸ�ʽ ȡʱ���ʽ ���ļ� �����ļ� ��ѡ�ļ� ѡ������ SetOpenFileNameWHook RemoveOpenFileNameWHook �ó�ʼ���ļ���W ��ʾͼ�� ����ͼ�� ����ͼ�� ȡ������ ע���ȼ� ȡ���ȼ� ȡ��� ���� ��ʾ ȡ�߶� ����ȫ�� �Ƿ����� �Զ����� ȡ���� ȡλ�� ȫ����С�� ����ȫ����С�� ������� �ѵ���ʾ���� ������ʾ���� ��ʾ���� ���� �л����� ���� ���������� д�������� ɾ���������� ȡ���������� ö�ٻ������� ȡ������ ȡ����Ŀ¼ ȡִ���ļ��� ȡCMD·�� ���� ���� ������ ȡ���� ���� ���� ����ʾ��Ϣ ������ʾ ��ͼ������ �ҽ��¼� ˢ������ ȡͼ��ID ȡͼ���� ɾ��ͼ�� ����ͼ�� ��ʾͼ�� ����ͼ�� ����ͼ�� ȡͼ����� ö��Ӳ�� ȡ���� ȡ�̼��汾 ȡ���� ȡ�ӿ����� ȡ������ �Ƿ����ý�� ȡý������ ȡ�ͺ� ȡ������ ȡPNP�豸ID ȡSCSI���� ȡSCSI�߼���Ԫ ȡSCSI�˿� ȡSCSIĿ��ID ȡ�ŵ����� ȡ���к� ȡ������ ȡ�ܴ�С ȡ�ܵ������� ȡ����ŵ� ȡ�ܵ������� ȡ�ܵĴŵ��� ȡ�����ֽ� ���� �ر� ������ ���� �ر� д���� �ļ�·�� ����ļ� �������̨ ����׵��� ��������� ����༭�� �����Դ��ھ�� ��������Ļ���� �����Զ��� ������ID �������� �Ƿ�� ȡID ȡ��Ԫ�� ȡ��Ԫ������ ȡ��Ԫ�� ö����Ԫ�� ȡ���� ������ ȡֵ ��ֵ ȡ���� ȡ��ɫ ȡ��ɫ�ı� ȡ״̬ ȡ״̬�ı� ȡ���� ȡ�������� ȡ��ݼ� ȡĬ�϶��� ȡ����Ԫ�� ȡѡ��Ԫ�� ѡ��Ԫ�� ȡλ�� ���� ���в��� ִ��Ĭ�϶��� ȡ���ھ�� ��ȡ���� ���� ����_���� ȡֵ ��ֵ ��ȡPost���� ��ȡЭ��ͷ���� ��ȡKey���� ��ȡValue���� ��� ɾ�� ��ȡJSON�ı� ��� ���� ȡֵ ��ֵ ��ȡPost���� ��ȡKey���� ��ȡValue���� �û�������С ѹ���ֽڼ� �����ֽڼ� ѹ���ı� �����ı� ѹ������ �������� ȡ���� ���� ȡ�ı� ȡ�ļ��� ���� ȡ�ı����� ������� ɾ���ı� �滻�ı����� ȡ���� Ѱ���ı����� �滻���ı����� ���_ȡ���� ���ı� ���ļ����� д�����ļ� ɾȫ���ո� ɾ��β�ո� ɾ�׿ո� ɾβ�ո� ��Сд��ĸ ����д��ĸ ��ʼ�� д �� ��_Ĭ�Ͻ����� ��_����ǰ׺ �������� ������ȡ ����λ��_���� ����λ��_��ȡ ����λ��_����_New ����λ��_��ȡ_New ����Cookie ����Cookie2 ����Cookie�ı� ����Cookie���� Cookie���� ɾ��Cookie ɾ��ȫ�� ȡCookie�ı� ȡȫ��Cookie ȡCookieֵ ȡCookie�� ȡCookie����� Cookie�Ƿ���� Cookie�Ƿ���������� Cookie�Ƿ�����ı��� �Ƿ�λ64λ���� ö��64λ����ģ�� ö��32λ����ģ�� ö�ٽ���ģ�� ȡ������ ȡ�ļ��� ģ����ȡ��� ����_ANSI ����_UTF8 ȡֵ_UTF8 ȡֵ_UNICODE ȡֵ_ANSI ��ʼ�� ��ʼ���� ���� ȡֵ ɾ�� �̳� ���� ������ �Ƿ�� ȡƥ�� ������ƥ�� �滻 �������滻 ȡ��ƥ�� ��������ƥ�� ȡƥ���� ȡ��ƥ���� ȡλ�� ȡָ�� ��ʾ ���� ���� ���� ��Ǽ��� ���� �ý�����ֵ �ý�����״̬ ע��ѡ� ж��ѡ� ��ѡ�˳�� ����ѡ� ���Ӱ�ť �޸İ�ť �ð�ťͼƬ�� �ø���ͼ�� ������ͼ��ʾ�ı� ������ͼ���� �¼�_��������ť������ �¼�_��������ť������ ���ӱ༭�� �����Ӳ˵� ���ò˵� �Ƴ��༭�� ��ʼ��ѡ��� ɾ���Ӽ� �����Ӽ� ȡ�Ӽ���Ŀ ȡ�Ӽб��� ȡ�Ӽ���ֵ ���Ӽб��� ���Ӽ���ֵ �������Ӽ� ȡ�����Ӽ� ɾ��ȫ���Ӽ� ȡͼƬ���� ȡ���� ����ͼƬ�� ���Ӽ�ͼƬ ���Ӽ����ߴ� ���Ӽ������� ��ʼ�� ����_��ʼ�� ����_��������ɫ ����_ɾ��������ɫ ����_���������ɫ ����_���и� ����_ȥ�������� ��ͷ_��������ʽ ������_�Ƿ��ڶ��˻�׶� ����ͼ_���� ����ͼ_���� ����ͼ_���� Aero_�Ƿ��� Aero_���� Aero_���� Aero_�߿�͸�� Aero_�ͻ���͸�� Aero_�ǿͻ�����Ч��Χ λͼ_ת_������ ������_ת_λͼ ������_ȡ_ĳ����ɫ ������_��_ĳ����ɫ ������_����ͼƬ_���� ������_����ͼƬ_���� ���� ����ͼ�� �����ļ� ת�����ֽڼ� ת�����ļ� ��䱳�� ȡͼƬ���� ȡͼƬ�߶� ȡͼƬ�ߴ� ȡͼƬ��� �ñ�����ɫ ��װsend ����send ��ͣsend ����send ȡ��ַ ж��send ��ʼ�� ���� ��װ ж�� �ص� �ص�ex ȡԭ���� ������Ŀ ��ʼ�����ֽڼ� ��ʼ�����ļ� ��ʼ�� ȡ��Ŀ ȡ��Ŀ�� ȡ������� ȡ��Ŀ�ı� ȡͼƬ ȡѡ��ͼƬ ȡ��Ŀ��ֵ ����Ŀ�ı� ��ͼƬ ��ѡ��ͼƬ ����Ŀ��ֵ �Ӵ� ȡ���Ӵ� �Ƿ��ѼӴ� ��չ �Ƿ�����չ ���� �Ƿ������� ������Ŀ ɾ����Ŀ ��� ȡ����Ŀ �Ƿ�������Ŀ ȡ����״̬ �ü���״̬ ������Ŀ_������� ������Ŀ_����״̬ ������Ŀ_ѡ��ͼƬ ������Ŀ_ͼƬ ������Ŀ_��ֵ ȡ��Ŀ��ʼλ�� ȡ��Ŀ���� ��������Ŀ_ȫ�� ��������Ŀ_�ı� ������Ŀ_EX ���� ���� _____�̳�______ ȡ�ڵ�_���ڵ���_���� ȡ�ڵ�_��Name_���� ȡ�ڵ�_��Class_���� ȡ�ڵ�_����_ȫ���ӽڵ� ȡ�ڵ�_����_ȫ����� _css_���� _css_����2 _css_1 ȡ�ڵ�_��id_1 ȡ���ڵ�_1 _Body_ ȡ���_iframe �Ƿ���ĳ���� �Ƿ���_���� �Ƿ����ӽڵ� ȡ�ڵ����� ȡ����ֵ_�������� ȡ�ڵ��� ȡtitle ȡID ȡclass ȡhref ȡouterText ȡinnerText ȡtextContent ȡinnerHTML ȡouterHTML _____�̳�______ _ ȡ��Ա ȡ��Ա�� ��ʼ�� ���� ȡ�ı� ���ı� ������ɫ ��װHOOK ж��HOOK ��ͣHOOK ����HOOK ȡ��ַ ȡԭ�ֽڼ� ��ȡ���� �������� ���� �Ƿ��� ��ʼ�� ���� ����api���� ��ȡһ��ip ���� ��ͣ ���� ֹͣ ���� ����ȫ���߳� ����_ȥ����ɫ ������_����ɫ �ı�_ȡ���� �ı�_�滻������ �ı�_ȡ�����ĸ �ı�_ȡ������� �ı�_�����ı���ĳ��ǰ �ı�_�����ı���ĳ�к� �ı�_�����ı���ĳλ�� �ı�_ȡָ���ļ��ı��� �ı�_ȡָ�������ı��� �ı�_ȡ�ı��г��ִ��� �ı�_ȡ�ı�����ʼλ�� �ı�_�����ı���ĳ��ǰ �ı�_�����ı���ĳ�ֺ� �ļ�_ɾ�����ý� �ļ�_ɾ�������� �ļ�_ȡ���ý������� �ļ�_ȡ������������ �ı�_ȡ��N�鲻�ظ����� �ı�_�ı��������� �ı�_ȡ�ı���ʼλ�� �ı�_������һ�� �ı�_�ߵ� �ı�_���� �ı�_ȫѡ �ı�_ȡ��� �ı�_ȡGB2312���庺�ֱʻ��� �ı�_�Ƿ�Ϊ���� �ı�_����ĸ�Ĵ�д �ı�_ȡ������λ�� �ı�_ȡ���ֻ����� �ļ�_���� �ļ�_ȡ�ļ��� �ļ�_ɾ��ĳ���ļ� �ļ�_��׺�Ƿ���� �ļ�_�ϲ��ļ� �ļ�_���� �ļ�_���� �ⲿ�б���_��� ��ҳ_ȡ��ַ�ļ��� ��ҳ_��ԭ��ҳ��ɫ ϵͳ_ȡ���� �ֽڼ�_�ֽڼ�ת�ı� �ֽڼ�_ʮ�����Ƶ��ֽڼ� ������_ȡ�����԰�װĿ¼ ������_�ӿ�ݷ�ʽ��IE����� ϵͳ_��ԭ��ԭɫ ϵͳ_�������� ϵͳ_�������� ϵͳ_ȡ���в��� ϵͳ_����������� ϵͳ_���ϵͳ��ʱĿ¼ ϵͳ_������������� ϵͳ_�ָ���������� �ļ�_ɾ�� �ļ�_�����ļ�Ŀ¼ ����_���ֲ��� ����_�������� ����_���ż��� ����_�ڲ����� ����_ȡԲ���� ����_������ ����_������ ����_���ص����� ����_���׵����� ����_��ֱ�߾��� ����_������������˫ ����_��׳� ����_����ʽ���� �ⲿ��Ͽ�_������Ŀ �ⲿ��Ͽ�_������Ŀ �ⲿ��Ͽ�_ȡ��Ŀ�� �ⲿ��Ͽ�_ȡѡ���� �ⲿ��Ͽ�_ɾ����Ŀ �ⲿ��Ͽ�_�����б� �ⲿ�б���_ȡ��Ŀ�� �ⲿ�б���_������Ŀ �ⲿ�б���_������Ŀ �ⲿ�б���_ɾ����Ŀ �ⲿ�б���_ȡѡ���� �ⲿ�б���_��ѡ���� �ⲿ�б���_ȡ��Ŀ�ı� �ⲿ�б���_ȡ��Ŀ��ֵ �ⲿ�б���_����Ŀ��ֵ �б���_���������ļ� �б���_����Ϊ�����ļ� �ⲿ��Ͽ�_ȡ��Ŀ��ֵ �ⲿ��Ͽ�_����Ŀ��ֵ �ⲿ��Ͽ�_��� �ⲿ��Ͽ�_ȡ��Ŀ�ı� �ⲿ��Ͽ�_������ѡ���� �ⲿѡ���_ѡ�� �ⲿѡ���_ȡ��ѡ�� �ⲿ��ѡ��_ѡ�� �ⲿ��ѡ��_ȡ��ѡ�� ϵͳ_�򿪿������ ϵͳ_�򿪿�������� ϵͳ_�����汳�� ����_�����˳� ���_���� �ı�_���� ����_�ö� ����_ȡ���� ��ҳ_ȡ��ַ���� ϵͳ_��ջ���վ ����_ȡ���˴��ھ�� �ı�_Ͷ�� ��ҳ_ȡ��ҳԴ�� ������_ģ�� ����_ȡ��괦���ھ�� ����_�ý��� ����_ȡ�ؼ����� ������Ϣ���� ����_��С�� �ļ�_�ƶ� ����_��ʾ���� �ⲿ������_��ʾ���� ʱ��_���� ʱ��_���� ����_��ס���� ����_ȡָ�����괦��� ����_��ԭ ����_ȡλ�úʹ�С ����_�Ƿ�ɼ� ����_�Ƿ���С�� ����_�Ƿ���� ����_ȡ������ �ı�_��Сд �ı�_����д ������Ϣ�ı� �ı�_ȡ��ĸ ����_ȡ��Ļ��� ����_ȡ�ؼ���С �߳�_ȡID ����_ȡ����� ����_ȡ���� ����_ȡ�����Ӿ�� ����_�Ƿ��Ӵ��� ���_���� ����_���� Ͷ����Ϣ���� ���_��Ϣ ����_ȡ�ؼ����� ���_��λ ���_��λ ����_����ȡ������ ����_������ȡ���� ���_���� ���_���� ���_���� ����_���� ����_���� ����_�ø� �ı�_ȡ�հ��ı� �ֽڼ�_ȡ�հ��ֽڼ� ����_ȡ���� ����_�Ƿ���� ����_����Ƿ���Ч ����_��͸���� ����_��� ����_������ǰ ����_��״̬ ����_�Ƿ������ �ļ�_ȡ��չ�� �ļ�_ȥ��չ�� �ļ�_����չ�� ����_��ϰ��� �ı�_ɾ��ָ���ı��� �ı�_ȡ�ı������� �ı�_ȡ������λ��2 ����_���ö�ٽ�����Ϣ ����_���ȡ����ID ����_�ر� ����_���� ����_ö�� ����_ö���Ӵ��� �ı�_ɾ��β�� �ı�_ȡ���� ��ҳ_�����ļ��Ƿ���� ϵͳ_������ѯ ϵͳ_�������� ϵͳ_���뷨ѡ�� ϵͳ_��ʽ������ ϵͳ_���������� ϵͳ_��������ʾ ϵͳ_����ͼ������ ϵͳ_����ͼ����ʾ ����_ɾ������ ��ҳ_��ָ����ַ Ŀ¼_ɾ������_cmd Ŀ¼_�����ļ�_cmd Ŀ¼_�ƶ��ļ�_cmd ϵͳ_�޸���ҳ Ŀ¼_�ƶ�������_cmd ����_�ñ��� ����_��ֹ�ر� ����_�ô��ڻ� ����_ȡ��괦�ؼ����� ����_���� ����_IDȡģ�� ����_ȡ������� ϵͳ_ȡ�û��� ϵͳ_ȡ������� ϵͳ_�����¼� ϵͳ_ȡ��ҳ��ַ ����_�����Ҽ��˵� ����_����Ȩ�� ����_����Ȩ�޵�Debug ��ҳ_ȡ�˿� ϵͳ_ȡ�������߶� ������_��ͼƬ ������_ȡ����Ȩ���ھ�� �ļ�_ȡ��ʽ ϵͳ_����ΪĬ������� Ŀ¼_ȡ��С Ŀ¼_ȡ��Ŀ¼�� Ŀ¼_ȡ����ʱ�� Ŀ¼_ȡβ��Ŀ¼�����ļ��� Ŀ¼_ȡ�ض�Ŀ¼ Ŀ¼_���� Ŀ¼_��� Ŀ¼_ȡWindowsĿ¼ Ŀ¼_ȡsystem32Ŀ¼ Ŀ¼_ȡ��ʱĿ¼ Ŀ¼_�Ƿ�Ϊ�� �ļ�_ִ�� �ļ�_ȡ·���̷� �ļ�_�����ļ��� �ļ�_ȡ���� �ļ�_ȡĿ¼ �ļ�_ȡ��С �ⲿ�༭��_ȡָ�����ı����� �ⲿ�༭��_ȡ��������к��к� �ⲿ�༭��_ȡ���� �ⲿ�༭��_������ �ⲿ�༭��_������ �ⲿ�༭��_ȡ���� �ⲿ�༭��_���� �ⲿ�༭��_ɾ�� �ⲿ�༭��_���� �ⲿ�༭��_ѡ�а�λ�� �ⲿ�༭��_ѡ�а����� �ⲿ�༭��_ȡ��ѡ�� �ⲿ�༭��_ȫѡ �ⲿ�༭��_���� �ⲿ�༭��_ȡָ�����ı� �ⲿ�༭��_��������� �ⲿ�༭��_ȡ���λ�� �ⲿ�༭��_�ڹ�괦�����ı� �ⲿ�༭��_��Ϊֻ����ʽ �ⲿ�༭��_��Ϊ���뷽ʽ �ⲿ�༭��_�����ұ߾� ������Ϣ�߼� �ⲿ�༭��_�����ַ��� �ⲿ�༭��_�����Ƿ�ı�� ϵͳ_ȡ��Ļ�ֱ��� ϵͳ_ȡ���̴�С��Ϣ ϵͳ_��ʼ��ť��ʾ ϵͳ_��ʼ��ť���� ϵͳ_��ʾ���� ϵͳ_�������� ϵͳ_ȡDOS·�� ϵͳ_ȡ���д����̷� ϵͳ_��ʾ�û������� ϵͳ_�����û������� ϵͳ_����ͼ����ʾ ϵͳ_����ͼ������ ϵͳ_ϵͳʱ����ʾ ϵͳ_ϵͳʱ������ ϵͳ_���񴰿���ʾ ϵͳ_���񴰿����� ϵͳ_��ʾ���ؿ��������� �ļ�_ȡʱ�� �ļ�_��ʱ�� ��ҳ_ȡҳ���ַ ����_��ͣ �߳�_���� ����_ȡ��������� ����_ȡ������ ����_Բ�ǻ� ���_��ʾ���� ���_���Ҽ����� ���_ȡ˫�����ʱ�� ���_ȡλ�� ���_�ƶ� ����_ö�������Ӵ��� Ŀ¼_ö����Ŀ¼ ���_���� ���_�ͷ� ����_���ȡ�߳�ID ����_��ť�����ֹ ����_��λ�úʹ�С ����_�ÿؼ����� ����_�ÿؼ�״̬ ����_�ÿؼ����� ���_ȡ�������� ���_��ָ�� ϵͳ_ȡ����������Ϣ �߳�_���� ����_ִ���ı��ӳ��� ����_ִ�������ӳ��� ����_���α༭���Ҽ� ����_ȡIE������� ����_����������Ҽ� ����_ȡ���괦��ɫ ����_��ɫת�� ����_ȡ���� ����_���� �ļ�_ö�� �ⲿ�б���_�������ȡ��Ŀ���� ����_ȡ�������� ����_ȡģ���� ����_���� ����_�Ƿ�ر� �ļ�_���� ����_ȡ��� ����_���ȡ������ ����_��ȡ��� �˵�_ȡ���� �˵�_ȡ�Ӿ�� �˵�_ȡ��� �˵�_ɾ�� �˵�_ȡ���� �˵�_�ػ� �˵�_�޸ı��� �˵�_ȡID ��ҳ_ȡ��ݷ�ʽ��ַ �˵�_��� Ŀ¼_��� ��ҳ_���� ��ҳ_�鿴��ҳ���� ��ҳ_��ӡ ��ҳ_��ӡԤ�� ��ҳ_ȫѡ ��ҳ_������ҳ���� ��ҳ_����html�ĵ� ����_�������� �˵�_��� �˵�_��������� �˵�_���� �˵�_ö�� ��ҳ_��ʼ������Ϣ�� ��ҳ_ֹͣ������Ϣ�� ��ҳ_�Զ������ҳ��Ϣ�� �ı�_ȡ������� ϵͳ_ȡCPU�ͺ� ϵͳ_ȡӲ�������� Ŀ¼_����ϵͳ���� Ŀ¼_ȡ��ϵͳ���� Ŀ¼_���ϵͳ���� ϵͳ_��ʾ�ػ��Ի��� ϵͳ_�л��û� ����_�Ƿ񱻵��� ϵͳ_�������״̬ �ı�_ȡ����ַ� ������_ȡͼƬ �˵�_ö���Ӽ��˵� �ı�_�滻 �ⲿ��ѡ��_ȡ״̬ �ⲿѡ���_ȡ״̬ ϵͳ_�������� �ⲿ�б���_ȡ��괦��Ŀ���� �ⲿ�༭��_ȡ������ı� ������_���ļ� ����ͨ��_���ն�_��ʼ�� ����ͨ��_���ն�_��ʼ���� ����ͨ��_���ն�_�رռ��� ����ͨ��_���ն�_ֹͣ���� ����ͨ��_���ն�_ȡ������ ����ͨ��_���ն�_������� ����ͨ��_���ն�_������� ����ͨ��_���Ͷ�_�������� �ⲿѡ���б���_ȡ��Ŀ�ı� �ⲿѡ���б���_ѡ�� �ⲿѡ���б���_�� �ⲿѡ���б���_ȡ��Ŀ�� �ⲿѡ���б���_ȡ��Ŀ��ֵ �ⲿѡ���б���_��� �ⲿѡ���б���_����Ŀ��ֵ �ⲿѡ���б���_������Ŀ �ⲿѡ���б���_������Ŀ ����_�ر� �߳�_ȡ���߳̾�� �߳�_��������֤ �߳�_ɾ������֤ �߳�_���������� �߳�_�˳������� �߳�_�ȴ� �߳�_���� �߳�_�ָ� ����_�������ָ�� ����_�� ����_д�� ����_�Ƿ����Ӵ��� ����_��ѡ��_�������� ����_��ѡ��_��ȡ���� ����_ѡ���_�������� ����_ѡ���_��ȡ���� ����_�༭��_�������� ����_�༭��_��ȡ���� ����_��Ͽ�_�������� ����_��Ͽ�_��ȡ���� OCX_ע�� OCX_ж�� �߳�_�� ����_���ȡ�߳̾�� ����_�ؼ��ӱ߿� ����_���ڿ�_�������� ����_���ڿ�_��ȡ���� Ŀ¼_���� ����_ȡ�ؼ�ID ����_�ؼ�IDȡ��� ����_���οؼ��Ҽ� ����_��͸����ɫ ϵͳ_ȡ������Ϣ ϵͳ_ȡ��������״̬ �ı�_�ݼ� �ı�_���� ����_ȡ����·�� ����_��ȡID ����_ȡ�Խ���ID �߳�_ȡ���߳�ID �߳�_��ʼ��COM�� �߳�_ȡ��COM�� ����_����1 �߳�_DLLע�� �߳�_DLLж�� ����_IDȡ������ ����_���� ϵͳ_�������������1 ϵͳ_�ָ����������1 ����_���ӵ�IE������ �ⲿ�����б���_�������� ����_��ʱ ����_�����ж� �ⲿ�����б���_ȡ��괦������ �ⲿ�����б���_ȡ��괦���к� �ı�_ճ�� ����_�ȴ�������ʧ ����_�ȴ������ʧ �ⲿ�༭��_�滻���� ����_ȡ��Сд״̬ ����_ȡС����״̬ ����_�ȴ��ؼ����ݸı� �ı�����_ֻȡ���� �ı�����_ֻȡ��ĸ �ı�����_ֻȡ���� �ı�����_ֻȡ���� �ⲿ�б���_�������� Ŀ¼_ȡ��·�� ϵͳ_ȡ�����ݷ�ʽ �Ի���_���ļ� �Ի���_�����ļ� �Ի���_����ɫѡ��� �Ի���_���ļ���ѡ�� �ļ�_����ӳ����� �ļ�_��ȡӳ����� ȡָ���ַ_С���� ȡָ���ַ_������ ȡָ���ַ_�������� ȡָ���ַ_�������� ȡָ���ַ_�ֽ��� ȡָ���ַ_�ֽڼ��� ȡָ���ַ_�ı��� ȡָ���ַ_�ӳ���ָ�� API_ȡ�հ��ı� API_ȡ�հ��ֽڼ� ָ��_���ı� ָ��_���ֽڼ� �ⲿ�༭��_ת��IE��ַ�� �˵�_����ͼ�� �Ի���_�����ղؼ� �Ի���_���ӵ��ղؼ� �ļ�_�����ļ��� ϵͳ_ȡ����ʱ�� �ⲿ�����б���_���� �ⲿ�����б���_���� �ؼ�_Բ�ǻ� ʱ��_תΪGMT��ʽ ʱ��_ȡ�������� ʱ��_ȡ�����ı� ʱ��_ȡ��ʽ���� ʱ��_ȡũ������ ʱ��_ȡ����֤�Ƚ� ʱ��_ȡ�й����ڼ� ʱ��_ȡ����֤���� ʱ��_ȡ����֤�Ա� ʱ��_����֤��ת�� ʱ��_����֤��15��18 ʱ��_���ı� ����_ȡ���_ģ�� �ⲿ��Ͽ�_�������� ����_�ȼ�ж������ ����_�ȼ�ע�� ����_�ȼ�ж�� Ŀ¼_���� ������_������ģ�� ϵͳ_���������ݷ�ʽ �ı�_ȡ��ƴ ϵͳ_�Ƿ������� ����_ȡ������ ����_��������ͼ�� ����_��ʾ����ͼ�� ����_����������ͼ�� ����_��ʾ������ͼ�� ϵͳ_ȡCPU���� ϵͳ_ȡCPU���� ϵͳ_ȡCPU������ ϵͳ_ȡCPUʱ��Ƶ�� ϵͳ_ȡCPU���ݿ��� ϵͳ_ȡCPUһ������ ϵͳ_ȡCPU�������� ϵͳ_ȡ������ ϵͳ_ȡ����IP ����_ȡID���� ϵͳ_ȡӲ��������1 ��ҳ_��ֹ����һ������ ��ҳ_��ֹ����gifͼƬ ��ҳ_��ֹ������������ ��ҳ_��ֹ������ʾͼƬ ��ҳ_��ֹ����������� �ֽڼ�_Ѱ��ȡ�� �ֽڼ�_Ѱ��ȡ�� �ļ�_ɾ��������վ ����_ִ�������ӳ���1 �ı�_ɾ������ ��ҳ_ת��ΪHTMLɫ �ⲿ�����б���_�����ƶ� ϵͳ_���ñ������� ϵͳ_���� ϵͳ_ǿ������ ϵͳ_ˢ����Ļ ϵͳ_ע�� ϵͳ_ǿ��ע�� ϵͳ_�ػ� ϵͳ_ǿ�ƹػ� �ⲿ�༭��_�����ı� ָ��_ȡ��16λ ָ��_ȡ��16λ ָ��_�Ƿ���Ч Ŀ¼_ͬ������ ����_����Flash �ı�_ȡ�ַ������� �ļ�_���� �ļ�_�� �ļ�_�ر� �ļ�_д���ֽڼ� �ļ�_�ƶ���дλ�� ��ҳ_��Cookie ��ҳ_��Cookie1 ϵͳ_�������������� �ⲿ�����б���_�Զ������п� �ⲿ�༭��_���ı߾� ��ҳ_ȡ����IP ϵͳ_ȡ������· ϵͳ_ȡMAC��ַ ����_��Ϣ �ı�_ȡ�м�_����_����ʽ ����_����DLL���� �߳�_����1 RAR_��ѹ�ļ� RAR_����ѹ���ļ� ȡָ���ı�_ ȡָ������_ ȡָ��С��_ ȡָ��˫����_ ȡָ���ֽڼ�_ ��ҳ_����������� ��ҳ_GZIPѹ�� ��ҳ_GZIP��ѹ ϵͳ_����IE������ַ ����_��� �ֽڼ�_Ѱ��ȡ�� E���ݿ�_���ٲ�ѯ E���ݿ�_�޸������ݿ� ����_ģ������ ��ҳ_ȡʮ������ɫֵ ����_������ ��ҳ_URLȡ���ص�ַ ��ҳ_������ҳ������ʾ �ֽڼ�_�ֽڼ���ʮ������ IP_ת��16���� IP_16����תIP �ļ�_�������Ժ��滻 ����_�Ƿ�����Ļ�� ��ҳ_�Զ������ҳ��Ϣ��_������ֵ ����_ȡ������������� ����_�����ȼ�_ע�� ����_�����ȼ�_ж�� ����_ID�Ƿ���Ч �ⲿ�༭��_����ʼѡ��λ�� ����_ȡ���λ�� ����_ȡ���λ��1 �ı�_�Ƿ��ظ� Ŀ¼_�Ƿ�����Ŀ¼ ��ҳ_���Cookie�ļ� ����_ö�ٽӿ� ����_ȡСͼ�� �߳�_�������_������ ��ʾ�� ��ҳ_JS��ʽ�� ϵͳ_�޸�MAC��ַ ϵͳ_ɾ��MAC��ַ �ı�_ȥ�ظ��ı� ��ҳ_ȡCookie ��ҳ_ȡ����Cookie ��ҳ_���Cookie ϵͳ_�Թ���Աģʽ�������� ϵͳ_ע����� ϵͳ_ж����� ����_ģ���������� ϵͳ_���host �ļ�_ö��1 ����_ȡ�ַ������� ����_������ö�� ����_ǿ����ʾ �ı�_ɾ��ָ���ļ��� ����_ȥ�ظ� ϵͳ_�Ƿ�64λ����ϵͳ ����_�ؼ�����_���� ����_�ؼ�����_���� ��ҳ_ɾ��IE�����ļ� ϵͳ_�ж���������ͷ ϵͳ_��ʱ����_��װ ϵͳ_��ʱ����_ж�� ����_ѭ���ر� �ļ�_ѭ��ɾ�� Ŀ¼_�Ƿ���� �ļ�_�Ƿ���� �ı�_ȡ�����Χ���� ����_���� Ŀ¼_ǿ����� ϵͳ_�޸Ŀ������� ����_д��־ �ı�_ȡ���ִ��� �߳�_ȡ��ֹ�߳��˳����� �ı�_�ʶ� ��ҳ_ȡ�ı�_reg ϵͳ_ȡ�����û������� �߳�_�������_�ı��� ����_Call ����_���� ����_��ת ϵͳ_ȡ�������� ϵͳ_��ʾ���� ����_���� ����_���� ����_������ ����_ȡ���� ����_���� ��ҳ_ȡ���� ϵͳ_�޸�IP��ַ�����غ��������� ϵͳ_ȡDOSִ�н�� ����_�������д��� ��ҳ_ȡ�ı�_dom ��ҳ_�������UA ������_ȡ�ļ� ������_���ı� ������_ȡ�ı� ����_����ת������ ����_����JS���� ����_URL���� ����_URL���� ����_BASE64���� ����_BASE64���� ����_���嵽���� ����_���嵽���� ����_usc2��ansi ����_ansi��usc2 ����_usc2��ansi_EX ����_ansi��usc2_EX ����_utf8��gb2312 ����_gb2312��utf8 ����_ASCII��Unicode ����_U����ת�� ����_Unicode��Ansi ����_Ansi��Unicode ����_Unicode��Ansi_�ı��� ����_Ansi��Unicode_�ı��� ����_Utf8��Unicode ����_Unicode��Utf8 ����_Ansi��Utf8 ����_Utf8��Ansi ����_BIG5������ ����_BIG5������ ����_���嵽BIG5 ����_���嵽BIG5 ����_����ʮ ����_�˵�ʮ ����_ʮ���� ����_����ʮ����ʮ У��_ȡmd5 У��_ȡmd5_�ı� У��_ȡmd4 У��_ȡmd2 У��_ȡrc4 У��_ȡsha1 У��_ȡcrc32 ����_�Ƿ��ö� ����_�Ƿ��ֹ ϵͳ_����Ļ�ֱ��� ʱ��_ȡ����ʱ��� ʱ��_ȡ���ʱ��� IP_ת��10���� IP_10����תIP �ⲿ�����б���_��������_NEW �ı�_תƴ�� �ļ�_ȡ������������1 ����_Utf8��Ansi_���� ����_Ansi��Utf8_���� ʱ��_תΪGMT��ʽ1 ʱ��_GMTתΪʱ�� ʱ��_תΪGMT��ʽ2 ʱ��_GMTתΪʱ��1 ��ҳ_ȡ���� �ļ�_ȡ�ߴ� ϵͳ_�����¼�1 �ļ�_���� �ļ�_����_��� ϵͳ_ȡ������ ϵͳ_ȡCPUռ���� ϵͳ_�ص�Դ ����_����Ex ϵͳ_�����Ҽ��˵���ͼ�� ����_����IE������ ʱ��_����ת�������� Ŀ¼_ö����Ŀ¼1 COM_bstr_t COM_QueryInterface COM_AddRef COM_Release COM_����COM���� COM_StringToCLSID COM_StringtoIID �ı�_ָ�뵽�ı�A �ı�_ָ�뵽�ı�W ϵͳ_ȡʱ�� ϵͳ_ȡ���ҷ��� ϵͳ_ȡ���ڸ�ʽ ϵͳ_ȡʱ���ʽ ����_�Ƿ񼤻� ����_ȡ���� ����_ȡ�ͻ������� ����_ȡ��ʽ ����_ȡ��չ��ʽ ����_ȡ�߿���� ����_ȡ�߿�߶� �ı�_��Сдm �ı�_ȡ�ұ� Ŀ¼_���� �ļ�_��λ Ŀ¼_��λ �ļ�_���ȡ·�� �ļ�_ȡ���� �ļ�_ȡ���� ϵͳ_ȡ���������� ϵͳ_ȡ������DNS��׺ ϵͳ_ȡ����ڵ����� ϵͳ_IP·���Ƿ����� ϵͳ_WINS�����Ƿ����� �߳�_�رվ�� ϵͳ_ȡIE�汾 ����_ȡ���ȼ� ����_�����ȼ� ����_ȡ������ ����_ȡ����� ����_ȡIO��ȡ���� ����_ȡIO��ȡ�ֽ� ����_ȡIO�������� ����_ȡIO�����ֽ� ����_ȡIOд����� ����_ȡIOд���ֽ� �ֽڼ�_���ı� �ֽڼ�_������ �ֽڼ�_ȡ��� �ֽڼ�_ȡ�ұ� �ֽڼ�_ȡ�հ� �ֽڼ�_ȡ���� �ֽڼ�_ȡָ��λ���ֽڼ� �ֽڼ�_�滻 �ֽڼ�_Ѱ�� �ֽڼ�_ȡָ�� ��ص�_ȡ���ַ ��ص�_�ͷŻص� ϵͳ_���ð��� ����_Ansi��ASCII_�ı��� ȡ����ָ�� ȡ������ָ�� Ŀ¼_ȡ����Ŀ¼ ����_���Ƴߴ� ����_ȡ���ߴ����� ����_ȡͬ��ID ϵͳ_��Ϣ��Ex �ı�_�Ƿ�Ϊ��ĸ Ŀ¼_ȡ����Ŀ¼ ��ҳ_������ݷ�ʽ ��ҳ_ȡ�����ļ��� ��ҳ_�Ƿ�Ϊ��ҳ ��ҳ_ȡ�����ļ��ߴ� ����_ȡ���� ����_ȡ�߳��� ʱ��_ȡ����֤�ж� ����_ö�� ����_�Ƿ��ڵ� �ı�_����c �ı�_����c �ı�_���� �ı�_���� �ⲿ��Ͽ�_�ر��б� COM_���������ռ� ʱ��_WMIʱ��ת���� �߳�_ö�� �ı�_ȡ������� ����_���� ����_��ͣ ����_ֹͣ ϵͳ_ת��Ϊ������ ϵͳ_ת��ΪIP��ַ ϵͳ_ͨ�Ų��� ����_Unicode��Ansi_���� �ļ�_ȡͼ���� ����_�Ƿ���� ����_�ȴ����� Ŀ¼_ȡ��ǰĿ¼ ʱ��_��ʽ�� ϵͳ_ȡCPU���к� �ļ�_ȡʵ�ʴ�С ϵͳ_ȡԶ�̻����� ϵͳ_Զ�̹ػ� ϵͳ_ȡIE���� ʱ��_ȡ��ʽ ����_ȡ��ID �ֽڼ�_���滻 �ֽڼ�_Ѱ���� ����_RC4���� ����_RC4���� ���_ȡ����� ʱ��_ʱ���ת�ı� ʱ��_��ʱ��� �߳�_��CPU ʱ��_ͬ��Уʱ ϵͳ_�Ƿ�Ϊ����Ա ����_��ֹ�ظ����� �߳�_ȡ״̬ ����_BASE64����A ����_BASE64����A ����_���ȡ����·�� �ı�_�Ƿ�Ϊ���� ����_�ϲ� �ı�_��ȡ���м��ı� ����_ʮ���� ʱ��_ȡ�³� ʱ��_ȡ��ĩ ʱ��_ȡĳ������ ʱ��_ȡ�������� ʱ��_ȡ�ڼ��� ����_�ػ� �ı�_�Զ����� ʱ��_��������ת���� ʱ��_ȡ�·� ����_ʮ��ʮ�� �ı�_���ַָ� ����_���� ϵͳ_ȡϵͳ�汾 �ı�_�Ƿ�Сд��ĸ �ı�_�Ƿ��д��ĸ �ֽڼ�_�ı�ת�ֽڼ� ʱ��_ȡ����ʱ��� ָ��_������ �ļ�_·���Ƿ�淶 Ŀ¼_�Ƿ���Ϲ淶 ��ҳ_Cookie�ϲ����� ����_�Ƿ񱻹��� ����_ȡ�������� ����_�ô������� ����_ȡ�ļ��汾�� �ļ�_ȡ�ļ��汾�� �ļ�_ö��EX ��ҳ_����_���� ��ҳ_���� rar_ѹ�� rar_��ѹ rar_�����ļ�ע�� rar_ɾ��ѹ�����ڵ��ļ� ʱ��_��ʽ��EX Ŀ¼_���� ���߼��� ����_Ansi��Utf8_��BOM�ļ� ����_��ʮ����ʮ ����_ʮ����ʮ�� ����_ȡ������ �ļ�_ȡ�ļ���Ϣ ����_ȡ�û��� �ֽڼ�_ȡ�м� ����_ȡ������32 ����_�ڴ�ʹ�� ����_IDȡ���ھ��EX ϵͳ_�Ƿ�ΪĬ������ У��_ȡsha512 У��_ȡsha256 �ԳƼ��� �Գƽ��� AES_DES_�㷨 У��_ȡhmac_md5 Ŀ¼_ȡ�ض�Ŀ¼EX �ļ�_ȡMP3����ʱ�� ����_���� �ļ�_ȡͼ�� ����_ȡ�����EX ���_ɾ����������Ƴ��¼� ���_ɾ��������������Ƴ��¼� ���_������������Ƴ��¼� �ź���_���� �ź���_�� �ź���_���� �ź���_���� �ź���_�ݼ� ����_URL����_JS �Ի洰��_����� �Ի洰��_Ͷ���ı� �Ի洰��_ȡ��Ϣ �Ի洰��_��ʽ����Ϣ �Ի洰��_���� ������_ģ��S ����_����GUID �ı�_ȡ���Ip ϵͳ_������ ϵͳ_�˳��� ϵͳ_������ԭ�� ϵͳ_ɾ����ԭ�� ϵͳ_�޸��û��� ��ҳ_eval���� ��ҳ_eval���� ����_COM����GUID ϵͳ_���Ӽƻ����� ϵͳ_ɾ���ƻ����� �ļ�_����1 ����_ʱ�� ����_���� ����_�ڴ�������EXE ϵͳ_ȡ������Ϣ ����_ǿ���������� ����_ǿ���򿪽��� ����_PIDȡ·�� ����_��λ ʱ��_ȡ����ʱ�� ϵͳ_������̲��� ����_����Ex �ı�_�ʶ�Ex ϵͳ_���巢�� ����_������������ ��ҳ_���ַ��� ��ҳ_Cookie�ϲ�����ex ������_ȡλͼ����A ������_ȡλͼ����B �ı�_ȡ���ı��к��� ��ҳ_JS��ʽ��_EX �ֽڼ�_�ֽڼ�ת�ı�ex �ֽڼ�_�ı�ת�ֽڼ�ex �߳�_����2 ��ҳ_ȡCookie2 �ı�_ɾ��� �ı�_ɾ�ұ� �ı�_ɾ�м� ����_IDȡ���ھ�� ���_���켣�ƶ� ָ��_���ֽ���_��� ָ��_���߼���_��� ָ��_����������_��� ָ��_��С����_��� ָ��_������ʱ����_��� ָ��_��˫����С����_��� ָ��_����������_��� __set __get CallObject SafeRelease �����ӳ���_ ȡ����_ͨ���� ȡָ��_ͨ���� ȡָ��_�ı��� ȡָ��_�ֽڼ��� ָ�뵽���� �ı�_�����ı����ؼ��������к� ϵͳ_ȡϵͳDPI ϵͳ_����DPI���� ��ҳ_Э��ͷ_ȡ��Ϣ ����_Ѱ������ �ڴ�_Զ�̴����ڴ�_�ı� �ڴ�_Զ�̴����ڴ�_�ֽڼ� �ڴ�_Զ�̵����ӳ��� �ڴ�_�ͷ�Զ���ڴ� ��Ļ����_���� ��Ļ����_���� ��Ļ����_��ʼ�� ����_��ֹ���� �ı�_ȡ�ı�������_�Ż��� ϵͳ_�������mac ����_ȡ���ܼ�״̬ ����_ȡ���ܼ��� ���_����_��װ ���_����_ж�� �ı�_ȡ���м��ı� ϵͳ_ȡ������Ϣ_���ǰ� _ֻȡ���� �ı�_�Ƿ�Ϊ����2 �ı�_ȡȫ������ƴ�� �ı�_ȡ�м�_���� ϵͳ_�ñ�������״̬ �ļ�_�ļ����Ƿ���� ϵͳ_ȡϵͳDPI_ע����� ����ת������ ����_URL����_���� Ŀ¼_ȡ�ļ��� �ı�_ɾ�м�2 �ı�_ɾ������_��� �ı�_���ַָ�_��� ��ҳ_ȡIP��ַ �ⲿ��Ͽ�_ȡ�����߶� �ⲿ��Ͽ�_ȡ�������� �ⲿ��Ͽ�_���ø߶� �ⲿ��Ͽ�_ȡ�߶� �ⲿ��Ͽ�_���������߶� �ⲿ��Ͽ�_������������ �ⲿ��Ͽ�_����չ���б� ���߼���_ͨ�ð� ȡ������ջ��ַ_�ֽڼ� ����ͼ�����ֽڼ� ��_ȡ�ڲ�������ַ ��_�ͷ��ڲ�������ַ ����_�Ƿ�ȫ�� ȡ����_ͨ����_���� ȡ������Ϣ�ı�_API �ļ�_����ϡ���ļ� �ļ�_�Ƿ���ϡ���ļ� ϵͳ_�����Ƿ�֧��ϡ���ļ� ϵͳ_ȡ����ϵͳ��� ϵͳ_ȡϵͳ��Ϣ ϵͳ_ȡϵͳ��Ϣ1 �ı�_�����ı� �ı�_�Ƿ�UTF8_��� ��ҳ_IE�������ҳ��ת���� ϵͳ_��ʾ������ ����_Ƕ������ �ڲ�_�����ֽڼ� �ڲ�_ȡ�ļ����� У��_ȡmd5_���� �ı�_Ѱ���ı� �ı�_��СдEX ����_ȡϵͳ�����б� �ı�_�ָ��ı� ��ҳ_����S ��ҳ_GZIPѹ��_�ı� ��ҳ_GZIP��ѹ_�ı� �ı�_ɾ��ָ���ļ��ı���1 �ı�_ɾ��ָ�������ı���1 �ı�_ȡָ���ļ��ı���1 �ı�_ȡָ�������ı���1 ����_�����Ϸ���Ϣ ����_ʮ����ʮ ����_ȡ����� ����_�ø����� ��ҳ_����Э��ͷ ָ��ת�� ָ�뻹ԭ ȡָ��_ͨ����_���� ����_��׼���� ����_��׼��� ����̨_���ٱ༭ģʽ �ı�_Ͷ��W ת��_ת���ݴ�СΪ��׼��ʾ ������_ȡ�������� ������_������ ����_�ô�͸ ʱ��_ȡʱ���� ����_����Ex ���_ȡ�����_Ӳ���� ���_ȡ���������_Ӳ���� ʱ��_ʮ��λʱ���ת���� ʱ��_����תʮ��λʱ��� ͼƬ_���� ͼƬ_ƴ�� ͼƬ_��˹ģ�� ͼƬ_ȡ����RGB ͼƬ_������RGB ͼƬ_��ˮӡ ͼƬ_ת�� ͼƬ_ת��1 ͼƬ_ת��Ex ͼƬ_ת��Ex_ȡ������ ͼ��_ȡ���� ͼƬ_ȡ��� ͼ��_ȡ��� ��ɫ_ȡ��ɫ ͼƬ_��̨��ͼ ͼƬ_��̨�����ͼ ͼƬ_ȡͼƬ���� ͼƬ_��Ļ��ͼ ͼƬ_��Ļ�����ͼ ͼƬ_ͨ�����ȡͼ�� ͼƬ_ȡ���� ͼƬ_ȡ�߶� ͼƬ_����_͸�� ��ҳ_����Э��ͷex �ı�_ȡ����ex ϵͳ_ȡ��������� �ⲿ�༭��_ȡ��������к��к�W ͼƬ_ȡ��Ƭ�������� ����_ʮ����ʮ_��� ͼƬ_ƴ��1 ����_���´��� ͼƬ_�ָ� �ڴ�_�޸����ڴ����ͷ� ����_ȡ������ַ_API �ڴ�_�޸��ڴ� �ڴ�_д���ڴ� �ڴ�_ȡָ����䳤�� �ڴ�_��תƫ�ƴ��� �ڴ�_�����ֽڼ� �ڴ�_�����ڴ� ����_ȡ�������� ����_ȡ�ӳ����ַ �ڴ�_ȡcalljmp��ַ ȡ�ӳ����ֽڼ����� ͼƬ_��24λͼ ͼƬ_ƽ������ �ı�_Ѱ�ҳ��ı���ɾ�� ����_�޳���� ϵͳ_ȡϵͳ�汾_��� ����_ȡ������� ����_�޳���չ��� �ı�_ȡ����W �ⲿ��Ͽ�_���� �ⲿ��Ͽ�_��ȷ���� ����_ȡ�����ļ���С_����� rar_�����ļ� �ļ�_�����ֽڼ� ʱ��_תΪGMT��ʽ3 ����_�ػ� BASE64����_ASM BASE64����_ASM ȡ�ı�����_ASM BASE64�����_ASM_��ʼ�� ����_�Ƿ���Ӧ ����_��������ť ����_ȥ�ظ�_������ ����_URL����_JS ����_URL����_�ֲ� ����_URL����_�ֲ� ����_UTF8���� ����_UTF8���� ϵͳ_ȡ��Ļ���� ����_ʮ������ת�з��ŵ�ʮ���� ����_�з��ŵ�ʮ����תʮ������ rar_ȡѹ�����ڵ��ļ����� ����_��Ϊ�޽��� ����_���Ƶ������� ����_����Сͼ�� �ı�_ȡĳλ���ı� �ļ�_�Ƿ�ռ�� ����_ȡ���_�ݹ� ����_ȡ�����ļ���·�� ����_ȡ��װĿ¼ rar_��ʼ�� ʱ��_JSONתΪʱ�� ʱ��_ʱ��תΪJSON ����_Ansi��Unicode_JS ����_Unicode��Ansi_JS ������_���� ������_ֹͣ���� ������_���� ʱ��_�ж϶�ʮ�Ľ��� ϵͳ_������Դ������ �ⲿ��Ͽ�_ȡ�ṹ��Ϣ ����_��ֹ���� ����_ע�ᴰ���ȼ� ����_���������ȼ� ����_�˿�ȡPID �ⲿ�б���_���ұ��� �ļ�_ȡ�ı����� ����_�ȴ����ڳ��� ʱ��_�뵽ʱ�����ʽ ʱ��_���ڼ�ȡ���� ϵͳ_�޸�DNS ����_URL����_���� ��ַ_ȡ���в��� ����_����������ͼ��״̬ ��ַ_ȡAPI��ַ ������_���ֽڼ� ��ҳ_����Ascii���� �߳�_����_�ı��� �����ӳ���_���� �߳�_����_8�ֽ� �߳�_����_4�ֽ� Ŀ¼_�Ƿ����W ϵͳ_ˢ�� ����_ë������Ч ��ַ_ȡָ������ֵ ����_PIDȡ�˿� ʱ��_ȡ���_��ʼ ʱ��_ȡ���_���� ��ҳ_����IE�汾 �ı�_�Ƿ�Ϊ˫�ֽ��ַ� �ı�_�Ƿ�Ϊ˫�ֽ��ַ�Ex �ⲿѡ���_��� __set_short __query_bit __set_bit_on __set_bit_off ����_ȡ�������������� ϵͳ_�����ļ�ϵͳ�ض��� ϵͳ_�ָ��ļ�ϵͳ�ض��� ����_ȡ·�� ��ʽ���ı�A ��ʽ���ı�W ��ʽ���ı�A_���� ��ʽ���ı�W_���� Ŀ¼_����W ϵͳ_ȡ����Դ���� ϵͳ_�ָ���Դ���� ϵͳ_ȥ������ ϵͳ_�ָ����� ����_��������_ע�� ����_��������_ж�� ����_Base64תͼƬ ����_�Ƿ�������������� Ŀ¼_ȡx86ϵͳĿ¼ ϵͳ_ȡ�����û��� ����_��С��ת�� ����_ȡ����W �ı�_��ȡ�м�_���� ����_ȡ��������ʱ�� ����_usc2��Unicode ����_Unicode��usc2 ����_ɾ������1 ����_��ֹ����W ϵͳ_������̲���1 ����_ȡ·��W ͼƬ_ȡ��ʽW ͼƬ_ȡ��ʽ �ļ�_ö��W ɾ��Unicode��β�հ��ֽ� �ı�_�����ı�1 bin2hex hex2bin ϵͳ_ע�����Ƿ����W ϵͳ_ȡ�ı�ע����W ϵͳ_д�ı�ע����W ϵͳ_ȡ��ֵע����W ϵͳ_д��ֵע����W ����_������ȡ����1 ��ҳ_������� ����_�з���ת�޷��� ��ҳ_����ȡ����IP ����_DEP���� �ļ�_�Ƿ�ΪĿ¼ �ֽڼ�_ʮ�����Ƶ��ֽڼ�2 �ֽڼ�_�ֽڼ���ʮ������2 ������_ȡ�ı�W ʱ��_ȡ����ʱ���1 ����_��ֹ��ͼ ����_ȡ������λ�� ����_�ù�����λ�� ����_�Ƿ�Ϊ64λ ϵͳ_ȡ����ʱ�� ϵͳ_����ʱ�� �ı�_����_�Ż� �ı�_����_�Ż� �ı�_ȡ�������_���� �ı�_���ַָ�_���� �ı�_���ַָ�_����_�ͷ� __set_byte __get_byte ����_�ϲ�_���� ϵͳ_ȡ����ͷ���� ϵͳ_ȡ�����豸���� �ļ�_��λ��� Ŀ¼_�������ļ��� ����_ȡ�ӽ���IDW ����_ȡ�ӽ���ID �ļ�_Ѱ���ļ�W ����_�������л���ָ���Ĵ��� �ļ�_��λW �ļ�_��λ���W �ļ�_ȡ��СW �ļ�_ִ��W �ļ�_ȡĿ¼W �ļ�_�Ƿ�ΪĿ¼W �ļ�_ɾ��W �ļ�_�Ƿ����W LOWORD HIWORD LOBYTE HIBYTE Ŀ¼_ɾ��Ŀ¼W Ŀ¼_ɾ��Ŀ¼ �ļ�_�Ƴ�����W �ļ�_�Ƴ����� �ļ�_����W �ļ�_�ƶ�W ����_�ػ�W �ļ�_�����ļ���W Ŀ¼_ȡ����Ŀ¼W Ŀ¼_ȡ�ض�Ŀ¼W ����_ȡͬ��IDW �ı�_�ı��Ƚ�W ����_����W Ŀ¼_ȡ��ǰĿ¼W ϵͳ_�Թ���Աģʽ��������W ����_��1 FileTimeToVariantTime �ļ�_ȡʱ��W VariantTimeToFileTime �ļ�_��ʱ��W ������_�з���ת�޷��� ����_ȡԶ�̻ỰID ϵͳ_ȡԶ�̻Ự�������� ϵͳ_ȡDOSִ�н��T ϵͳ_ȡ�Կ���Ϣ�б� ϵͳ_����ȡ����վ�е��ļ� ϵͳ_����������W ϵͳ_���������� ����_�˽��ƽ��� Ŀ¼_���W �Ի���_���ļ���W �Ի���_���ļ��� ϵͳ_ȡ�������������� GetKeyPathFromHKEY ϵͳ_ͨ���߼��̷���ȡ�����豸�� �ı�_��β����ת�� ����_DLLȡ������Ϣ AdjustString �ļ�_�ļ�����W ����_DLLȡ������Ϣ1 ����_���ȡ����ID ����_�Ƿ񱻵��� ����_ȡϵͳ�汾 ϵͳ_ȡ�����ݷ�ʽW ����_IDȡģ�����б� ϵͳ_���������ݷ�ʽW ָ��_���ֽڼ�W Ŀ¼_�����ļ�����ʾ����W Ŀ¼_�����ļ�����ʾ���� ϵͳ_ȡ������������������ ϵͳ_ȡ������������������W ����_���õ�ǰ�������� ����_���õ�ǰ������ ����_��ǰ�����Ƿ��� ����_ȡ��ǰ�������� ����_ö��W ������_�з���ת�޷��� OpenWindowsDlg ���_ȡָ���ƶ��ٶ� ���_����ָ���ƶ��ٶ� �ֽڼ�_��ת ��ҳ_�ϵ�����W Ŀ¼_����ļ��޸� Ŀ¼_����ļ��޸�W ��ҳ_�ϵ����� �ļ�_ö��_���� �ļ�_ȡ����W ����_ȡ͸���� �ļ�_����1 ϵͳ_ȡ����IP �ļ�_ȡ�ļ��汾��ϢW ʱ��_ȡNTP������ʱ��� ϵͳ_ȡϵͳ����ʱ�� ʱ��_��ʽ������ ϵͳ_ȡ����ʱ�� �ı�_�����ַ�����ʽ�� ϵͳ_WMI���ӽ���W ����_��ϰ���1 ϵͳ_������������ ϵͳ_������������W ϵͳ_ȡ������������λ�� ϵͳ_ȡ������������λ��W EnumParenthwnd GetIPropertyStore SetIPropertyStore ϵͳ_����ͼ�굽��Դ������W ϵͳ_ɾ����Դ��������ͼ��W ϵͳ_����ͼ�굽��Դ������ ϵͳ_ɾ����Դ��������ͼ�� ϵͳ_�����Ҽ��˵���ִ��W ϵͳ_�����Ҽ��˵���ִ�� ����_αװ��Դ������ ����_ȡ��Դ�ַ���W ����_ȡ��Դ�ַ��� ����_������������W ����_������������W ����_������������ ����_�Զ����б���ĿW ����_���ù̶����� SaveBitmapToImage �ļ�_�Ƿ�Ϊ64λW �ļ�_�Ƿ�Ϊ64λ ����_�Ƿ񱻹���1 �ļ�_�޸ķ���Ȩ��W �ļ�_�޸ķ���Ȩ�� ϵͳ_�Ƿ�ΪServer�汾 CopyBitmap ����_ȡִ��Ȩ�޼��� �ļ�_����PE����� �ļ�_����PE������ �ļ�_ȡMIME����W �ļ�_ȡMIME���� ����_�Ƿ��й���Ա��Ȩ ����_αװ��Դ������W InterlockedAddNoFence64 ����_ö�ٽ���ģ�� ����_ȡģ����1 ����_��ʱ1 Ŀ¼_��ȡ����·������W Ŀ¼_��ȡ����·������ ����_����1 ͼƬ_WIA���� ����_ȡ���ֿ��� ����_ȡ���ֿ��ߵ��ֺ� GetImageFileToBitmap GetImageToBitmap ϵͳ_�����޸�����ID ����_�ý��� SetMessageBoxHook RemoveMessageBoxHook ϵͳ_д��ֵע���� ϵͳ_ȡ��ֵע���� ϵͳ_д�ı�ע���� ϵͳ_ȡ�ı�ע���� ϵͳ_ע�����Ƿ���� ϵͳ_ɾ��ע����W ϵͳ_ɾ��ע���� �߳�_Զ�̵���DLL���� �Ի���_�򿪷�ʽ �Ի���_�򿪷�ʽW ����_���û���ö�ٽ��� ����_���û���ö�ٽ���W __get_short �ϲ������� VariantTimeToQuadPart QuadPartToVariantTime LOWPART HIGHPART ʱ��_��ʱ���1 ʱ��_ʱ���ת�ı�1 �ı�_������ �ı�_������W ����_ȡ�ڴ�ռ�� test_time ���VMP_A ���VMP_B �����б���_�����ı� �����б���_�����ֽڼ� ���_�ֽڼ���ʮ�������ı� ���_ʮ�������ı����ֽڼ� ���_ȡ����ip ��׳����б���_ȡ����ѡ���� ��׳����б���_�������� ��׳����б���_��ȡ���� ��׳����б���_ˢ����� ��׳����б���_ȫ��ѡ�� ��׳����б���_ȫ����ѡ ��׳����б���_������ɾ������ ��ҳ_����x ���_ȡ����IP_����ͻ��� ���_�ڴ��Ż� ���_��ȡһ������ ���_Ѷ�������� ���_�������� ���_ɾ����ʱ�ļ� ���_ȡ���MAC ���_ȡ���IMEI ���_ȡGUID                 ����sk�xis 	�൴��ƻ��;s 	s 	s 	s 	s   	      �0vy                                                   �              �         IbR     	��  � 	   	      _b��  �            }bI��  �        s�q"[s 
˨���Ż��;s 
s 
s 
s 
s   
      �� �                                           IbRHb    `bIbR��   ��IbRab   a�IbRf�&    h�IbRHb   ��IbR��    ��IbR`�&    ��IbR]�&    ��IbR^�&    ��IbR�    �IbR�    +�IbRHb   ��ss s                                                                                        