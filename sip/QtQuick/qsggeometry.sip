// qsggeometry.sip generated by MetaSIP on Fri Mar 14 14:38:44 2014
//
// This file is part of the QtQuick Python extension module.
//
// Copyright (c) 2014 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt5.
// 
// This file may be used under the terms of the GNU General Public License
// version 3.0 as published by the Free Software Foundation and appearing in
// the file LICENSE included in the packaging of this file.  Please review the
// following information to ensure the GNU General Public License version 3.0
// requirements will be met: http://www.gnu.org/copyleft/gpl.html.
// 
// If you do not wish to use this file under the terms of the GPL version 3.0
// then you may purchase a commercial license.  For more information contact
// info@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


class QSGGeometry /Supertype=sip.wrapper/
{
%TypeHeaderCode
#include <qsggeometry.h>
%End

public:
// Convenient primitives and drawing modes.
enum /NoScope/
{
    GL_BYTE,
    GL_DOUBLE,
    GL_FLOAT,
    GL_INT
};

enum /NoScope/
{
    GL_POINTS,
    GL_LINES,
    GL_LINE_LOOP,
    GL_LINE_STRIP,
    GL_TRIANGLES,
    GL_TRIANGLE_STRIP,
    GL_TRIANGLE_FAN
};

    struct Attribute
    {
%TypeHeaderCode
#include <qsggeometry.h>
%End

        int position;
        int tupleSize;
        int type;
        uint isVertexCoordinate;
        static QSGGeometry::Attribute create(int pos, int tupleSize, int primitiveType, bool isPosition = false) /Factory/;
    };

    struct AttributeSet /NoDefaultCtors/
    {
%TypeHeaderCode
#include <qsggeometry.h>
#include <QVector>
%End

        AttributeSet(SIP_PYOBJECT attributes /DocType="sequence-of-QSGGeometry.Attribute"/, int stride = 0);
%MethodCode
            PyObject *iter = PyObject_GetIter(a0);
            
            if (!iter
            #if PY_MAJOR_VERSION < 3
                || PyString_Check(a0)
            #endif
                || PyUnicode_Check(a0))
            {
                Py_XDECREF(iter);
                PyErr_SetString(PyExc_TypeError, "iterable object expected");
                sipError = sipErrorContinue;
            }
            else
            {
                QVector<QSGGeometry::Attribute> attrs;
                int stride = 0;
            
                for (SIP_SSIZE_T i = 0; ; ++i)
                {
                    PyErr_Clear();
                    PyObject *itm = PyIter_Next(iter);
            
                    if (!itm)
                    {
                        if (PyErr_Occurred())
                            sipError = sipErrorFail;
            
                        break;
                    }
            
                    int state, is_err = 0;
                    QSGGeometry::Attribute *attr;
            
                    attr = reinterpret_cast<QSGGeometry::Attribute *>(
                            sipForceConvertToType(itm, sipType_QSGGeometry_Attribute, 0,
                            SIP_NOT_NONE, &state, &is_err));
            
                    if (is_err)
                    {
                        PyErr_Format(PyExc_TypeError,
                                "index " SIP_SSIZE_T_FORMAT " has type '%s' but 'QSGGeometry.Attribute' is expected",
                                i, Py_TYPE(itm)->tp_name);
            
                        Py_DECREF(itm);
                        sipError = sipErrorFail;
            
                        break;
                    }
            
                    // Calculate the stride if there no explicit one.
                    if (a1 <= 0)
                    {
                        int size;
            
                        switch (attr->type)
                        {
                        case GL_BYTE:
                            size = sizeof (qint8);
                            break;
            
            #if GL_DOUBLE != GL_FLOAT
                        case GL_DOUBLE:
                            size = sizeof (double);
                            break;
            #endif
            
                        case GL_FLOAT:
                            size = sizeof (float);
                            break;
            
                        case GL_INT:
                            size = sizeof (qint32);
                            break;
            
                        default:
                            size = 0;
                        }
            
                        if (!size)
                        {
                            PyErr_Format(PyExc_TypeError,
                                    "index " SIP_SSIZE_T_FORMAT " has an unsupported primitive type",
                                    i);
            
                            sipReleaseType(attr, sipType_QSGGeometry_Attribute, state);
                            Py_DECREF(itm);
                            sipError = sipErrorFail;
            
                            break;
                        }
            
                        stride += attr->tupleSize * size;
                    }
            
                    attrs.append(*attr);
            
                    sipReleaseType(attr, sipType_QSGGeometry_Attribute, state);
                    Py_DECREF(itm);
                }
            
                Py_DECREF(iter);
            
                if (sipError == sipErrorNone)
                {
                    if (attrs.isEmpty())
                    {
                        PyErr_SetString(PyExc_TypeError, "no attributes defined");
                        sipError = sipErrorFail;
                    }
                    else
                    {
                        PyObject *bytes = SIPBytes_FromStringAndSize(
                                reinterpret_cast<char *>(attrs.data()),
                                sizeof (QSGGeometry::Attribute) * attrs.size());
            
                        if (!bytes)
                        {
                            sipError = sipErrorFail;
                        }
                        else
                        {
                            sipCpp = new QSGGeometry::AttributeSet;
            
                            sipCpp->count = attrs.size();
                            sipCpp->stride = (a1 > 0 ? a1 : stride);
                            sipCpp->attributes = reinterpret_cast<QSGGeometry::Attribute *>(
                                    SIPBytes_AS_STRING(bytes));
            
                            sipSelf->user = bytes;
                        }
                    }
                }
            }
%End

        int count;
        int stride;
        const QSGGeometry::Attribute *attributes /DocType="read-only-array-of-QSGGeometry.Attribute"/ {
%GetCode
            sipPy = sipConvertToTypedArray((void *)sipCpp->attributes,
                    sipType_QSGGeometry_Attribute, "iiiI", sizeof (QSGGeometry::Attribute),
                    sipCpp->count, SIP_READ_ONLY);
%End

%SetCode
            sipErr = 1;
            PyErr_SetString(PyExc_ValueError, "array is read-only");
%End

        };
    };

    struct Point2D
    {
%TypeHeaderCode
#include <qsggeometry.h>
%End

        float x;
        float y;
        void set(float nx, float ny);
    };

    struct TexturedPoint2D
    {
%TypeHeaderCode
#include <qsggeometry.h>
%End

        float x;
        float y;
        float tx;
        float ty;
        void set(float nx, float ny, float ntx, float nty);
    };

    struct ColoredPoint2D
    {
%TypeHeaderCode
#include <qsggeometry.h>
%End

        float x;
        float y;
        unsigned char r /PyInt/;
        unsigned char g /PyInt/;
        unsigned char b /PyInt/;
        unsigned char a /PyInt/;
        void set(float nx, float ny, uchar nr /PyInt/, uchar ng /PyInt/, uchar nb /PyInt/, uchar na /PyInt/);
    };

    static const QSGGeometry::AttributeSet &defaultAttributes_Point2D() /NoCopy/;
    static const QSGGeometry::AttributeSet &defaultAttributes_TexturedPoint2D() /NoCopy/;
    static const QSGGeometry::AttributeSet &defaultAttributes_ColoredPoint2D() /NoCopy/;

    enum DataPattern
    {
        AlwaysUploadPattern,
        StreamPattern,
        DynamicPattern,
        StaticPattern,
    };

    QSGGeometry(const QSGGeometry::AttributeSet &attribs /KeepReference/, int vertexCount, int indexCount = 0, int indexType = GL_UNSIGNED_SHORT);
    virtual ~QSGGeometry();
    void setDrawingMode(GLenum mode);
    GLenum drawingMode() const;
    void allocate(int vertexCount, int indexCount = 0);
    int vertexCount() const;
    void *vertexData();
    int indexType() const;
    int indexCount() const;
    void *indexData();
    int attributeCount() const;
    SIP_PYOBJECT attributes() const /DocType="read-only-array-of-QSGGeometry.Attribute"/;
%MethodCode
        sipRes = sipConvertToTypedArray((void *)sipCpp->attributes(),
                sipType_QSGGeometry_Attribute, "iiiI", sizeof (QSGGeometry::Attribute),
                sipCpp->attributeCount(), SIP_READ_ONLY);
%End

    int sizeOfVertex() const;
    static void updateRectGeometry(QSGGeometry *g, const QRectF &rect);
    static void updateTexturedRectGeometry(QSGGeometry *g, const QRectF &rect, const QRectF &sourceRect);
    void setIndexDataPattern(QSGGeometry::DataPattern p);
    QSGGeometry::DataPattern indexDataPattern() const;
    void setVertexDataPattern(QSGGeometry::DataPattern p);
    QSGGeometry::DataPattern vertexDataPattern() const;
    void markIndexDataDirty();
    void markVertexDataDirty();
    float lineWidth() const;
    void setLineWidth(float w);
    SIP_PYOBJECT indexDataAsUInt() /DocType="array-of-unsigned-int"/;
%MethodCode
        sipRes = sipConvertToArray(sipCpp->indexDataAsUInt(), "I",
                sipCpp->indexCount(), 0);
%End

    SIP_PYOBJECT indexDataAsUShort() /DocType="array-of-unsigned-short"/;
%MethodCode
        sipRes = sipConvertToArray(sipCpp->indexDataAsUShort(), "H",
                sipCpp->indexCount(), 0);
%End

    SIP_PYOBJECT vertexDataAsPoint2D() /DocType="array-of-QSGGeometry.Point2D"/;
%MethodCode
        sipRes = sipConvertToTypedArray(sipCpp->vertexDataAsPoint2D(),
                sipType_QSGGeometry_Point2D, "ff", sizeof (QSGGeometry::Point2D),
                sipCpp->vertexCount(), 0);
%End

    SIP_PYOBJECT vertexDataAsTexturedPoint2D() /DocType="array-of-QSGGeometry.TexturedPoint2D"/;
%MethodCode
        sipRes = sipConvertToTypedArray(sipCpp->vertexDataAsTexturedPoint2D(),
                sipType_QSGGeometry_TexturedPoint2D, "ffff",
                sizeof (QSGGeometry::TexturedPoint2D), sipCpp->vertexCount(), 0);
%End

    SIP_PYOBJECT vertexDataAsColoredPoint2D() /DocType="array-of-QSGGeometry.ColoredPoint2D"/;
%MethodCode
        sipRes = sipConvertToTypedArray(sipCpp->vertexDataAsColoredPoint2D(),
                sipType_QSGGeometry_ColoredPoint2D, "ffbbbb",
                sizeof (QSGGeometry::ColoredPoint2D), sipCpp->vertexCount(), 0);
%End

    int sizeOfIndex() const;
};
