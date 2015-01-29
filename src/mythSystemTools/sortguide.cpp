#include "sortguide.h"
#include <QStringListModel>
#include <QSortFilterProxyModel>
#include <QtCore>
SortGuide::SortGuide(QObject *parent) :
    QObject(parent)
{
}
void SortGuide::getModel(const QStringList &title )
{
    QStringList data;
    data << title;
    m_model = new QStringListModel(this);
    m_model->setStringList(data);
    m_filter = new QSortFilterProxyModel(this);
    m_filter->setSourceModel(m_model);
    m_filter->setFilterCaseSensitivity(Qt::CaseInsensitive);
}
QString SortGuide::searchPredicate() const
{
    return m_searchPredicate;
}

void SortGuide::setSearchPredicate(const QString & nSearchPredicate)
{
    if (nSearchPredicate != m_searchPredicate) {
        m_searchPredicate = nSearchPredicate;
        m_filter->setFilterFixedString(searchPredicate());
        emit searchPredicateChanged(searchPredicate());
    }
}
